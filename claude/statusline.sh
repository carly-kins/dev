#!/bin/bash
# Claude Code status line: model · context % · cost · rate limits · parking lot · git branch
# Reads the session JSON on stdin (see https://code.claude.com/docs/en/statusline.md).
# Defensive: any field that's absent is simply omitted, so it degrades gracefully.

in=$(cat)
field() { printf '%s' "$in" | jq -r "$1" 2>/dev/null; }

model=$(field '.model.display_name // "?"')
cost=$(field '.cost.total_cost_usd // 0')
ctx=$(field '.context_window.used_percentage // empty')
used_tok=$(field '.context_window.total_input_tokens // empty')
win=$(field '.context_window.context_window_size // empty')
h5=$(field '.rate_limits.five_hour.used_percentage // empty')
h5_resets=$(field '.rate_limits.five_hour.resets_at // empty')
d7=$(field '.rate_limits.seven_day.used_percentage // empty')
cwd=$(field '.workspace.current_dir // .cwd // empty')
[ -z "$cwd" ] && cwd=$(pwd)
pl=""
if [ -n "$cwd" ] && [ -x "$HOME/.claude/parking-lot.sh" ]; then
  pl=$("$HOME/.claude/parking-lot.sh" count "$cwd" 2>/dev/null)
fi
branch=""
ahead_behind=""
if [ -n "$cwd" ]; then
  branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
  # Ahead/behind: only when an upstream is configured
  if [ -n "$branch" ] && git -C "$cwd" rev-parse --abbrev-ref '@{upstream}' &>/dev/null; then
    ab=$(git -C "$cwd" rev-list --left-right --count '@{upstream}...HEAD' 2>/dev/null)
    if [ -n "$ab" ]; then
      behind=$(printf '%s' "$ab" | awk '{print $1}')
      ahead=$(printf '%s' "$ab"  | awk '{print $2}')
      ab_str=""
      [ "$ahead"  -gt 0 ] 2>/dev/null && ab_str="${ab_str}↑${ahead}"
      [ "$behind" -gt 0 ] 2>/dev/null && ab_str="${ab_str}↓${behind}"
      ahead_behind="$ab_str"
    fi
  fi
fi

# AEM author up/down (cached 30 s in /tmp/claude-statusline-aem-$USER)
aem_dot=""
_aem_cache="/tmp/claude-statusline-aem-${USER}"
_aem_now=$(date +%s)
_aem_use_cache=0
if [ -f "$_aem_cache" ]; then
  _aem_ts=$(awk 'NR==1{print $1}' "$_aem_cache" 2>/dev/null)
  _aem_age=$(( _aem_now - ${_aem_ts:-0} ))
  [ "$_aem_age" -lt 30 ] && _aem_use_cache=1
fi
if [ "$_aem_use_cache" -eq 1 ]; then
  _aem_up=$(awk 'NR==1{print $2}' "$_aem_cache" 2>/dev/null)
else
  if curl -s -o /dev/null --max-time 1 'http://localhost:4502/libs/granite/core/content/login.html' 2>/dev/null; then
    _aem_up=1
  else
    _aem_up=0
  fi
  printf '%s %s\n' "$_aem_now" "$_aem_up" > "$_aem_cache" 2>/dev/null
fi
[ "$_aem_up" -eq 1 ] 2>/dev/null && aem_dot="🟢" || aem_dot="🔴"

# Colors (dark-terminal palette) + dim separator
C_MDL=$'\033[36m'    # cyan        — model
C_CTX=$'\033[33m'    # yellow      — context %
C_CTX_WARN=$'\033[1;31m'  # bold red — context ≥80%
C_CST=$'\033[32m'    # green       — cost
C_RLM=$'\033[35m'    # magenta     — rate limits
C_RLM_WARN=$'\033[1;31m'  # bold red — 5h rate limit ≥90%
C_PL=$'\033[34m'     # blue        — parking lot
C_TKT=$'\033[97m'    # bright white — ticket
C_GIT=$'\033[94m'    # bright blue  — git branch
C_DOT_DIRTY=$'\033[33m'   # orange/yellow — uncommitted changes
C_DOT_CLEAN=$'\033[32m'   # green         — clean working tree
C_AB=$'\033[96m'     # bright cyan   — ahead/behind remote
D=$'\033[2m'         # dim
RS=$'\033[0m'        # reset

sep="${D} · ${RS}"

kfmt() { awk -v n="$1" 'BEGIN{
  if(n=="") {print ""; exit}
  if(n>=1000000) printf "%.1fM", n/1000000;
  else if(n>=1000) printf "%dk", int(n/1000+0.5);
  else printf "%d", n; }'; }

parts=("${C_MDL}${model}${RS}")

[ -n "$aem_dot" ] && parts+=("${aem_dot} AEM")

if [ -n "$ctx" ]; then
  ctxint=${ctx%.*}
  # Context warning: bold red + ⚠️  prefix when ≥80%
  if [ "$ctxint" -ge 80 ] 2>/dev/null; then
    ctx_color="$C_CTX_WARN"
    ctx_prefix="⚠️  "
  else
    ctx_color="$C_CTX"
    ctx_prefix=""
  fi
  if [ -n "$used_tok" ] && [ -n "$win" ]; then
    parts+=("${ctx_color}${ctx_prefix}ctx ${ctxint}% ($(kfmt "$used_tok")/$(kfmt "$win"))${RS}")
  else
    parts+=("${ctx_color}${ctx_prefix}ctx ${ctxint}%${RS}")
  fi
fi

cost_str="${C_CST}$(awk -v c="$cost" 'BEGIN{printf "$%.2f", c}')${RS}"
parts+=("$cost_str")

# 5h rate limit: bold red + ⏳ prefix when ≥90%; append ⏰ reset time when ≥70% and resets_at present
if [ -n "$h5" ]; then
  h5int=$(awk -v p="$h5" 'BEGIN{printf "%.0f", p}')
  if [ "$h5int" -ge 90 ] 2>/dev/null; then
    rl_color="$C_RLM_WARN"
    rl_prefix="⏳ "
  else
    rl_color="$C_RLM"
    rl_prefix=""
  fi
  h5_reset_str=""
  if [ "$h5int" -ge 70 ] 2>/dev/null && [ -n "$h5_resets" ] && [ "$h5_resets" != "null" ]; then
    h5_reset_str=" ⏰ $(date -r "$h5_resets" '+%-I:%M%p' 2>/dev/null | tr '[:upper:]' '[:lower:]')"
  fi
  parts+=("${rl_color}${rl_prefix}5h ${h5int}%${h5_reset_str}${RS}")
fi
[ -n "$d7" ] && parts+=("${C_RLM}7d $(awk -v p="$d7" 'BEGIN{printf "%.0f%%", p}')${RS}")
[ -n "$pl" ] && [ "$pl" != "0" ] && parts+=("${C_PL}🅿 ${pl}${RS}")

# Git branch: ticket segment + branch + dirty dot
if [ -n "$branch" ]; then
  # Ticket: extract first LETTERS-DIGITS pattern from branch name (case-insensitive)
  ticket=$(printf '%s' "$branch" | grep -oiE '[A-Za-z]+-[0-9]+' | head -1 | tr '[:lower:]' '[:upper:]')
  [ -n "$ticket" ] && parts+=("${C_TKT}🎫 ${ticket}${RS}")

  # Dirty dot: one git call for porcelain status
  if git -C "$cwd" status --porcelain 2>/dev/null | grep -q .; then
    dot=" ${C_DOT_DIRTY}●${RS}"
  else
    dot=" ${C_DOT_CLEAN}●${RS}"
  fi
  ab_seg=""
  [ -n "$ahead_behind" ] && ab_seg=" ${C_AB}${ahead_behind}${C_GIT}"
  parts+=("${C_GIT}⎇ ${branch}${ab_seg}${RS}${dot}")
fi

out="${parts[0]}"
for i in "${!parts[@]}"; do
  [ "$i" -eq 0 ] && continue
  out="${out}${sep}${parts[$i]}"
done
printf '%s' "$out"
