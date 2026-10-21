---
name: grill-prd
description: A relentless interview about a PM's PRD, sorting what's yours to design from what only your team can answer. Re-run it on each new PRD draft.
disable-model-invocation: true
---

The UX folder config (issue tracker, paths) should have been provided to you. If not, tell the user to run `/setup-codingforux-skills`.

## Before the first round

1. **Get the PRD.** The user passes it as pasted text, a file, a doc link or a tracker issue. Fetch a link with whatever tool reaches it; when none does, ask the user to paste the PRD. Done when you hold the full PRD text.
2. **Find the brief.** Look in the tracker for an open issue labelled `ux-brief` for this PRD. If one exists and a PRD snapshot sits next to it, this is a **re-grill**: see Re-grilling below. If none exists, create it: title from the PRD, body only the PRD source link for now (`to-ux-brief` writes the rest).
3. **Open the affected personas.** Read `personas/index.md` in the UX folder and open only the personas this PRD touches. Read the glossary.

## Grilling

Interview the user relentlessly until you reach a shared understanding of the PRD. Map this as a **design tree**: every decision branches into the decisions that hang off it.

The tree's first branches are the PRD's items. Mark each one:

- **Yours**: a design decision. The user settles it here.
- **Not yours**: engineering, business or legal. Record it so nobody re-asks, then leave it.
- **Needs alignment**: only your team (the PM, engineering, anyone else) can answer it. Park it (below).

Mark by design surface, not by who the PRD names. An item framed as engineering or business is still **yours** when it changes what a user sees, reads or does: a new permission means a new state; an SSO requirement means a changed sign-in screen.

Round one shows the PRD cut down to what matters for design: the **yours** items in full, each with its proposed mark, and the **not yours** items as one short list the user can skim and pull back. The user confirms or corrects the marks. Never grill a not-yours item, and ask about the business reason behind an item only when the answer would change the design.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask _now_ without guessing at answers you haven't heard yet. Ask the whole frontier in one round: number each question and give your recommended answer. Then wait for the user's answers before the next round.

Format a round like so:

```
❓ **Q1** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>

---

❓ **Q2** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>
```

Each round the user answers reshapes the tree: settled decisions push the frontier outward and unblock questions that depended on them. Recompute the frontier and ask the next round. A question whose answer depends on another question still open in this round belongs to a _later_ round, not this one.

**Challenge the PRD.** Raise each of these as a question:

- **Unexplained design decisions.** The PRD prescribes a solution with no reason ("onboarding is two pages"). Ask what problem it solves. A real constraint stays; a guess becomes **yours**.
- **Now vs later.** What this release must achieve, and what the long-term goal is. The design should meet the first without blocking the second.
- **Success.** How the team will know it worked. What's measured shapes what the design puts first.
- **Missed people.** A need, frustration or accessibility need from an open persona that the PRD doesn't serve.
- **Wrong words.** A word the glossary tells you to avoid.

When only your team can answer, park it.

Finding _facts_ is your job, never the user's. When a frontier question needs a fact from the environment (files, the tracker, Figma), dispatch a sub-agent to find it; don't ask the user for anything you could look up yourself. Don't block on it: a running exploration is an unsettled prerequisite, so only the questions downstream of it wait for the sub-agent to report; ask the rest of the frontier now. The _decisions_ are the user's: put each to them and wait.

## Parking team questions

When a question only your team can answer surfaces, **park** it: create a sub-issue of the brief labelled `needs-alignment`. Title it as the question; in the body put the PRD item it comes from and the decisions waiting on it. Questions downstream of a parked question wait with it; the rest of the frontier carries on.

## Persona updates

When the PRD reveals something new about a persona (a need, a context of use, a frustration the file doesn't have), propose the change as a question in the next round, with the exact lines to add. Save it to the persona file only once the user approves.

## Snapshot

Save the PRD next to the brief as `briefs/<brief-slug>-prd.md` in the UX folder: the source link, today's date, the full PRD text, then a `## Settled` section listing each item's mark (with the owner, for not-yours items) and every answer reached. Update `## Settled` as answers land, so a later re-grill keeps them.

## Re-grilling

When the PRD is a new draft, compare it against the saved snapshot and grill only what changed: new, changed and removed items re-enter the frontier, and everything else keeps its mark and answer from `## Settled`. Answers recorded on closed `needs-alignment` sub-issues are settled too. When the new draft answers a question still open, propose closing its sub-issue with that answer recorded. Overwrite the snapshot with the new draft, carrying `## Settled` forward.

## Done

The session is done when the frontier holds only parked questions: every branch of the design tree visited, nothing left silently assumed. Then say what is still waiting on your team: "That's as far as we can get until A, B and C are answered." Name each open `needs-alignment` sub-issue and offer to move to `/to-ux-questionnaire`. With nothing parked, offer `/to-ux-brief` instead. Do not act on either until the user confirms you have reached a shared understanding.
