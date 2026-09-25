#!/bin/bash
# PreToolUse (Write): keep personal notes docs OUT of the repo tree.
# Dashboards, the parking lot, and reviewer-plan pages belong in
# ~/.claude/projects/<project>/notes/ — never committed to the repo.
input=$(cat)
path=$(printf '%s' "$input" | /usr/bin/python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null)
base=$(basename "$path")

# Unambiguous personal-notes filenames. (Plans/specs may legitimately live in-repo, so not matched.)
if printf '%s' "$base" | grep -qiE '(dashboard|parking-lot|reviewplan)'; then
  case "$path" in
    "$HOME/.claude/projects/"*) : ;;  # correct location — allow
    "$HOME/.claude/templates/"*) : ;;  # template source itself, not an instance doc — allow
    "$HOME/dev/claude/templates/"*) : ;;  # same, via its real (non-symlink) path — allow
    *) echo "Blocked: '$base' is a personal notes doc — write it under ~/.claude/projects/<project>/notes/, never inside the repo." >&2; exit 2 ;;
  esac
fi
exit 0
