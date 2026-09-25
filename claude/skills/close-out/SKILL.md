---
name: close-out
description: Run the end-of-ticket close-out sweep before calling a ticket done — verify the working tree holds only intended changes, the spec/plan/dashboard are current and consistent, deferrals are parked, and capture a one-line lessons note if the process pinched. Use when a ticket's implementation is finished, before handing off for commit or opening a PR.
---

# Close-out sweep

The named final step of every ticket (CLAUDE.md guardrail #8). Run each check, report the result in plain words, and stop on anything that isn't clean — don't silently pass it.

## 1. Working tree scope
- Run `git status --porcelain` and `git diff --stat`.
- Confirm every changed file is in the plan's change list. **Any file outside it is a stop-and-ask** — surface it, don't absorb it.
- Confirm tests are staged (or ready to stage) as their own change, separate from implementation.

## 2. Spec matches the diff
- Re-read the feature spec (`docs/specs/<feature>.md`).
- Does the behavior in the diff match what the spec says? A behavior change with no matching spec edit is a finding — fix the spec now, not at review.

## 3. Docs current and consistent
- Plan (its review/as-built state) reflects what was actually built, with any differences from the plan called out.
- Dashboard (if a coding ticket, the plan HTML itself): steps marked, verification panel current, no stale "in progress".
- The three don't contradict each other.

## 4. Deferrals parked
- Anything raised mid-ticket but not done is in the parking lot with a continuation stub — nothing lives only in chat.

## 5. Lessons note (only if the process pinched)
- If something about the process itself chafed this ticket, write a one-line lessons note to memory (`feedback_*`). If nothing pinched, skip it — no filler.

## Report
End with a short plain-language summary: what's clean, what needs attention, and the recommended next action (usually: stage the test commit, then the implementation commit, then open the PR). Never claim a check passed that you didn't actually run.
