---
name: plan-walk
description: Use when presenting any plan or multi-part answer with more than 3 steps — delivers a one-screen overview, writes full detail to the session dashboard, then walks one gated step at a time with user approval before each.
---

# Plan Walk — gated step-at-a-time delivery

This skill governs HOW a finished plan is presented and paced. It does not create
plans (brainstorming/writing-plans do that).

## Flow

1. **Overview (chat, one screen max):** numbered steps S1…Sn, one line each.
   Small flow? Add a compact ASCII sketch. Never include per-step detail here.
2. **Doc:** write the full plan to the session dashboard (create one from
   `~/.claude/templates/session-dashboard.html` if none exists): Mermaid diagram,
   per-step detail inside collapsed `<details>`, stable IDs, 💬 buttons. Open it.
3. **Gate:** ask "Approve S1?" showing ONLY S1's detail (≤1 screen).
4. **Execute** the approved step. Tick it ✓ on the dashboard with a one-line
   result. Report one line in chat.
5. **Repeat** gate → execute for S2…Sn.

## Rules

- Never show two steps' detail at once; detail beyond the current step lives only in the doc.
- Feedback like `re S4: do X instead` → revise the doc, keep all IDs stable (never renumber), continue from the current gate.
- If executing a step reveals a later step is wrong, STOP at the gate and flag it. Never silently replan.
- Every gate response ends with the standard Confidence line.
