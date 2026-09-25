#!/bin/bash
# PreToolUse (Bash): hard-block `git add` / `git commit`.
# Version control is the engineer's job — this makes the CLAUDE.md rule mechanical,
# so neither the main agent nor a subagent can stage or commit.
input=$(cat)
cmd=$(printf '%s' "$input" | /usr/bin/python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('command',''))" 2>/dev/null)

# Match a real `git add` / `git commit` invocation (word-boundaried), not e.g. `git log --grep=add`.
if printf '%s' "$cmd" | grep -qiE '(^|[;&|]|[[:space:]])git[[:space:]]+(add|commit)([[:space:]]|$)'; then
  echo "Blocked: never run 'git add' or 'git commit' — staging and committing are the engineer's job. Make the edits and hand off; the engineer commits." >&2
  exit 2
fi
exit 0
