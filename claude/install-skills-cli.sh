#!/bin/bash
# Bootstrap the `npx skills` global skill packages (installs into ~/.agents/skills,
# symlinked from ~/.claude/skills). Source list taken from ~/.agents/.skill-lock.json.
# Mirrors new-machine/install_homebrew.sh: a flat, re-runnable list of commands.

echo "*** Installing global skill packages"
npx skills add cypress-io/ai-toolkit@cypress-author -g -y
npx skills add cypress-io/ai-toolkit@cypress-explain -g -y
npx skills add vercel-labs/skills@find-skills -g -y

# i-have-adhd is a hand-written custom skill, not an npx-skills package — it lives in
# claude/skills/i-have-adhd (symlinked from ~/.claude/skills), no install step needed here.
