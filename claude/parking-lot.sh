#!/bin/bash
# ~/.claude/parking-lot.sh — in-window parking lot.
# The HTML file stays the source of truth; this is a thin read/append layer.
# Usage: parking-lot.sh <count|sections|list|add|done> <dir> [args]
set -uo pipefail

PROJECTS_ROOT="${PL_PROJECTS_ROOT:-$HOME/.claude/projects}"

sanitize() { printf '%s' "$1" | sed 's/[^A-Za-z0-9]/-/g'; }
resolve_file() { printf '%s/%s/notes/parking-lot.html' "$PROJECTS_ROOT" "$(sanitize "$1")"; }

cmd_count() {
  [ $# -ge 1 ] || { echo "usage: parking-lot.sh count <dir>" >&2; return 1; }
  local f; f="$(resolve_file "$1")"
  [ -f "$f" ] || return 0
  grep -oE '<div class="item">' "$f" | wc -l | tr -d ' '
}

cmd_sections() {
  local f; f="$(resolve_file "$1")"
  [ -f "$f" ] || return 0
  perl -0777 -ne '
    while (/<h2[^>]*>(.*?)<\/h2>/gs) {
      my $t = $1;
      $t =~ s/<[^>]+>//g;
      $t =~ s/&amp;/\&/g; $t =~ s/&lt;/</g; $t =~ s/&gt;/>/g;
      $t =~ s/\s+/ /g; $t =~ s/^\s+|\s+$//g;
      print "$t\n";
    }' "$f"
}

cmd_list() {
  local f; f="$(resolve_file "$1")"
  if [ ! -f "$f" ]; then echo "No parking lot for this project."; return 0; fi
  # Parser note: assumes one item <div class="item..."> opening tag per line
  # (Claude Code's parking-lot convention). Same-line item+content would not
  # be previewed correctly.
  perl -CSD -ne '
    BEGIN { $section="(no section)"; $in=0; $open_n=0; }
    sub strip { my $s=shift; $s//=""; $s=~s/<[^>]+>/ /g;
      $s=~s/&amp;/\&/g; $s=~s/&lt;/</g; $s=~s/&gt;/>/g;
      $s=~s/\s+/ /g; $s=~s/^\s+|\s+$//g; return $s; }
    sub flush {
      return unless $in;
      if (!$done) {
        $open_n++;
        my $t = strip(join(" ", @buf));
        $t = substr($t,0,200)."…" if length($t) > 200;
        print "[$open_n] ($bufsec) $t\n";
      }
      $in=0; @buf=();
    }
    if (/<h2[^>]*>(.*?)<\/h2>/) { flush(); $section=strip($1); next; }
    if (/<div class="item">/)      { flush(); $in=1; $done=0; $bufsec=$section; @buf=(); next; }
    if (/<div class="item done">/) { flush(); $in=1; $done=1; $bufsec=$section; @buf=(); next; }
    if (/^\s*<\/body>/)            { flush(); next; }
    next if /class="meta"/;      # drop the date/context line from the preview
    push @buf, $_ if $in;
    END { flush(); }
  ' "$f"
}

cmd_show() {
  [ $# -ge 2 ] || { echo "usage: parking-lot.sh show <dir> <n>" >&2; return 1; }
  local f n; f="$(resolve_file "$1")"; n="$2"
  case "$n" in ''|*[!0-9]*) echo "show requires a positive item number" >&2; return 1 ;; esac
  if [ ! -f "$f" ]; then echo "No open item #$n" >&2; return 1; fi
  # Parser note: assumes one item <div class="item..."> opening tag per line
  # (Claude Code's parking-lot convention). Same-line item+content would not
  # be parsed correctly.
  PL_N="$n" perl -CSD -ne '
    BEGIN {
      $section="(no section)"; $in=0; $open_n=0;
      $target=$ENV{PL_N}; $found=0;
    }
    sub strip { my $s=shift; $s//=""; $s=~s/<[^>]+>/ /g;
      $s=~s/&amp;/\&/g; $s=~s/&lt;/</g; $s=~s/&gt;/>/g;
      $s=~s/\s+/ /g; $s=~s/^\s+|\s+$//g; return $s; }
    sub flush {
      return unless $in;
      if (!$done) {
        $open_n++;
        if ($open_n == $target) {
          my $t = strip(join(" ", @buf));
          print "($bufsec) $t\n";
          $found=1;
        }
      }
      $in=0; @buf=();
    }
    if (/<h2[^>]*>(.*?)<\/h2>/) { flush(); $section=strip($1); next; }
    if (/<div class="item">/)      { flush(); $in=1; $done=0; $bufsec=$section; @buf=(); next; }
    if (/<div class="item done">/) { flush(); $in=1; $done=1; $bufsec=$section; @buf=(); next; }
    if (/^\s*<\/body>/)            { flush(); next; }
    next if /class="meta"/;
    push @buf, $_ if $in;
    END { flush(); exit($found ? 0 : 3); }
  ' "$f"
  local rc=$?
  if [ "$rc" -ne 0 ]; then echo "No open item #$n" >&2; return 1; fi
}

cmd_path() {
  [ $# -ge 1 ] || { echo "usage: parking-lot.sh path <dir>" >&2; return 1; }
  local f; f="$(resolve_file "$1")"
  [ -f "$f" ] || return 0
  printf '%s\n' "$f"
}

cmd_add() {
  [ $# -ge 3 ] || { echo "usage: parking-lot.sh add <dir> <section> <text> [stub]" >&2; return 1; }
  local f section text stub date tmp
  f="$(resolve_file "$1")"; section="$2"; text="$3"; stub="${4:-}"
  [ -f "$f" ] || { echo "No parking lot file at $f" >&2; return 1; }
  date="$(date +%F)"
  tmp="$(mktemp "$(dirname "$f")/.pl.XXXXXX")"
  PL_SEC="$section" PL_TEXT="$text" PL_DATE="$date" PL_STUB="$stub" perl -ne '
    BEGIN {
      $sec=$ENV{PL_SEC}; $txt=$ENV{PL_TEXT}; $date=$ENV{PL_DATE}; $stub=$ENV{PL_STUB};
      for ($txt, $stub) { s/&/&amp;/g; s/</&lt;/g; s/>/&gt;/g; }
      $done=0; $in_target=0;
      sub norm { my $s=shift; $s=~s/<[^>]+>//g;
        $s=~s/&amp;/\&/g; $s=~s/&lt;/</g; $s=~s/&gt;/>/g;
        $s=~s/\s+/ /g; $s=~s/^\s+|\s+$//g; return lc($s); }
      $target=norm($sec);
    }
    if (!$done && $in_target && (/<div class="item"/ || /<h2/ || /^\s*<\/body>/)) {
      my $extra = $stub ? "  <div class=\"stub\"><em>Continue: $stub<\/em><\/div>\n" : "";
      print "<div class=\"item\">\n  <div class=\"meta\">$date · via /pl add<\/div>\n  <strong>$txt<\/strong>\n$extra<\/div>\n";
      $done=1; $in_target=0;
    }
    print;
    if (!$done && /<h2[^>]*>(.*?)<\/h2>/) {
      if (norm($1) eq $target) { $in_target=1; }
      else { $in_target=0; }
    }
    END { exit($done ? 0 : 3); }
  ' "$f" > "$tmp"
  local rc=$?
  if [ "$rc" -ne 0 ]; then rm -f "$tmp"; echo "Section not found: $section" >&2; return 1; fi
  mv "$tmp" "$f"
}

cmd_done() {
  [ $# -ge 2 ] || { echo "usage: parking-lot.sh done <dir> <n>" >&2; return 1; }
  local f n tmp
  f="$(resolve_file "$1")"; n="$2"
  [ -f "$f" ] || { echo "No parking lot file at $f" >&2; return 1; }
  case "$n" in ''|*[!0-9]*) echo "done requires a positive item number" >&2; return 1 ;; esac
  tmp="$(mktemp "$(dirname "$f")/.pl.XXXXXX")"
  PL_N="$n" perl -ne '
    BEGIN { $target=$ENV{PL_N}; $cnt=0; $hit=0; }
    if (/^\s*<div class="item">/) {   # open items only (not "item done")
      $cnt++;
      if ($cnt == $target) { s/<div class="item">/<div class="item done">/; $hit=1; }
    }
    print;
    END { exit($hit ? 0 : 3); }
  ' "$f" > "$tmp"
  local rc=$?
  if [ "$rc" -ne 0 ]; then rm -f "$tmp"; echo "No open item #$n" >&2; return 1; fi
  mv "$tmp" "$f"
}

main() {
  local sub="${1:-}"; shift || true
  case "$sub" in
    count)    cmd_count "$@" ;;
    sections) cmd_sections "$@" ;;
    list)     cmd_list "$@" ;;
    show)     cmd_show "$@" ;;
    path)     cmd_path "$@" ;;
    add)      cmd_add "$@" ;;
    done)     cmd_done "$@" ;;
    *) echo "unknown subcommand: $sub" >&2; return 2 ;;
  esac
}
main "$@"
