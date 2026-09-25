---
name: resume
description: Use when returning to a project after a break or starting a fresh session on ongoing work — finds the newest session dashboard and recaps state in 5 lines or fewer, then waits.
---

# Resume — 5-line recap from the dashboard

1. Compute the project's notes dir:
   `~/.claude/projects/$(pwd | sed 's/[^A-Za-z0-9]/-/g')/notes/`
2. Find the newest `*dashboard*.html` there (by mtime). Also check
   `notes/archive/` if none found. If still none: say so in one line, offer to
   check parking lot (/pl) and MEMORY.md Active Work instead. Stop.
3. Read ONLY that dashboard. Reply in at most 5 lines:
   - **Goal:** (its goal line)
   - **Done:** last completed step (highest ✓ S#)
   - **Now:** current step (► S#)
   - **Waiting on you:** open Q# items, or "nothing"
   - **Suggested next:** one action
4. Then WAIT for direction. Do not start executing. Do not re-read chat
   transcripts or other notes unless asked.
