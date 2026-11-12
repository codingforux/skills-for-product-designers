---
name: to-ux-tickets
description: Break a UX brief or the current conversation into a set of thin vertical slices, each one you can design, review and hand off on its own, grouped into passes with a designer review after each, and published as sub-issues of the brief with their blocking edges.
disable-model-invocation: true
---

# To Tickets

Break a UX brief into a set of **tickets**: thin vertical slices, each declaring the tickets that **block** it.

The issue tracker, triage label vocabulary and UX folder should have been provided to you. If not, tell the user to run `/setup-codingforux-skills`.

## Process

### 1. Gather context

Work from whatever is already in the conversation context. If the user passes a reference (a brief's issue number, URL or file), fetch it and read its full body, comments and sub-issues. Ticket titles and descriptions should use the words in the UX folder's glossary.

If the brief already fits one slice (say, a redesign of a single screen), stop: tell the user there is nothing to split, and that implement-ux-brief can take the brief directly.

### 2. Draft vertical slices

Break the work into thin vertical slices.

<vertical-slice-rules>

- The first slice is the **happy path**: the main path through the work, end to end, in its default states. It sets the direction, so the user approves it before anything builds on it
- Each later slice is one more path a user can take, designed completely: every state, breakpoint and piece of copy that path needs ("Card declined", "Edit the delivery address"). Most are blocked by the happy path
- Vertical, NOT a horizontal slice of one layer across the whole brief ("all the error states", "wireframes first, visuals later")
- The size of a slice follows the work: a redesign of one screen is one slice; a flow splits by step or by path ("Sign in with a code", "Recover a forgotten password"); a whole product splits by area, then by flow
- A completed slice can be reviewed and handed off on its own
- Each slice is sized to fit in a single fresh context window
- No user story or requirement is left out: each one is covered by some ticket. A ticket may cover several; a requirement that cuts across the whole brief goes on every ticket it touches. Non-functional requirements (N1, N2…) bind every ticket and stay in the brief

</vertical-slice-rules>

Give each ticket its **blocking edges**: the other tickets that must complete before it can start. A ticket with no blockers can start immediately.

Mark each ticket **agent** or **human**. A ticket is human when it needs work the agent can't do through the Figma MCP, or taste the brief can't spell out: new illustration or iconography, motion, brand exploration. Most tickets are agent.

Group the tickets into **passes**: the tickets UX agents design in one go before they stop for the user's review. Number the tickets in the order they'll be designed, so each pass is a run of numbers ending at a **checkpoint**: "review after 2 and 8" makes three passes, 1–2, 3–8 and 9 to the end. Recommend a checkpoint:

- after the happy path, unless the tickets beside it in pass 1 don't build on it
- after a ticket that sets a direction later tickets copy, such as a new component, layout or pattern
- before explorations, so they start from approved frames

Every ticket's blockers sit in its own pass or an earlier one.

### 3. Quiz the user

Present the proposed breakdown as a numbered list. For each ticket, show:

- **Title**: short descriptive name
- **Blocked by**: which other tickets (if any) must complete first
- **Who**: agent or human
- **What it delivers**: what the user can do once this ticket is designed, and the user story and requirement numbers it covers

Below the list, give the recommended checkpoints in one line ("Review after: 2, 8"), with the reason for each.

Ask the user:

- Is the happy path the right main path?
- Are the checkpoints in the right places: does each review come before the tickets that build on its direction?
- Does the granularity feel right? (too coarse / too fine)
- Are the blocking edges correct: does each ticket only depend on tickets that genuinely gate it?
- Should any tickets be merged or split further?
- Are the right tickets marked human?

Iterate until the user approves the breakdown.

### 4. Publish the tickets to the configured tracker

Publish the approved tickets. **How** depends on the tracker `/setup-codingforux-skills` configured; the tickets are the same either way, only the shape of the blocking edges changes:

- **Local markdown** → write one file per ticket under `briefs/<brief-slug>/tickets/<NN>-<slug>.md` in the UX folder, numbered from `01` in dependency order (blockers first). Each file's "Blocked by" lists the numbers/titles it depends on. Use the per-ticket file template below: one ticket per file, never a single combined file.
- **A real issue tracker (GitHub, GitLab, …)** → publish one issue per ticket as a sub-issue of the brief, in dependency order (blockers first) so each ticket's blocking edges can reference real identifiers. Use the platform's native blocking relationship where it has one; otherwise set each ticket's "Blocked by" to the blocking issues.

Label pass 1's tickets `ready-for-ux-agent`, or `ready-for-designer` for tickets marked human. Later passes carry no ready label (on local markdown, `Status: waiting`): implement-ux-brief labels each pass when the user opens it.

Each ticket's checklist is the user stories it covers, each with its acceptance criteria, and the functional requirements it covers, copied word for word from the brief with their numbers.

Work the **frontier**: any ticket whose blockers are all done. For a purely linear chain that means top to bottom.

Do NOT close or modify the brief.

<local-ticket-template>

# <NN>: <Ticket title>

**Brief:** the brief file this ticket belongs to.

**What to design:** what the user can do once this ticket is designed, from their perspective, not a screen-by-screen list.

**Blocked by:** the numbers/titles of the tickets that gate this one, or "None (can start immediately)".

**Pass:** 2 of 3 · agent (or human)

**Status:** ready-for-ux-agent or ready-for-designer in pass 1; waiting in later passes

- [ ] 3. As a <persona>, I want <thing>, so that <benefit>
  - <acceptance criterion>
- [ ] 4. As a <persona>, I want <thing>, so that <benefit>
- [ ] R2. <requirement>

</local-ticket-template>

<issue-template>

## Parent

A reference to the brief.

## What to design

What the user can do once this ticket is designed, from their perspective, not a screen-by-screen list.

## User stories

- [ ] 3. As a <persona>, I want <thing>, so that <benefit>
  - <acceptance criterion>
- [ ] 4. As a <persona>, I want <thing>, so that <benefit>

## Requirements

- [ ] R2. <requirement>

## Blocked by

- A reference to each blocking ticket, or "None (can start immediately)".

## Pass

2 of 3 · agent (or human)

</issue-template>

In either form, describe what the user does and sees, not layouts or components: implement-ux-brief picks those from the library.
