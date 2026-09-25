#!/bin/bash
# Bootstrap Claude Code's marketplaces + plugins on a new machine.
# Mirrors new-machine/install_homebrew.sh: a flat, re-runnable list of commands.
#
# NOT covered here (auto-provisioned, no action needed):
#   - claude-plugins-official marketplace — Claude Code auto-installs this itself.
#   - Anything listed as "Synced from claude.ai" by `claude plugin list` (e.g.
#     data@synced, creative-suite@synced) — pulled automatically for the account.
#
# Company-specific marketplaces/plugins (Reingold) live in the gitignored
# install-plugins.company.sh alongside this file, run below if present.

echo "*** Installing plugins"
claude plugin install superpowers@claude-plugins-official
claude plugin install mattpocock-skills@claude-plugins-official

company_script="$(dirname "$0")/install-plugins.company.sh"
if [ -f "$company_script" ]; then
  echo "*** Installing company-specific plugins"
  bash "$company_script"
else
  echo "No install-plugins.company.sh found — skipping company-specific plugins (see NOTES.md to recreate it)."
fi
