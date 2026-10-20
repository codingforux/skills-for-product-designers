---
name: to-design-brief
description: "Turn the current conversation into a design brief and publish it to the project issue tracker: no interview, just synthesis of what you've already discussed. Pass an existing brief's link to fold in a scope change."
disable-model-invocation: true
---

This skill takes the current conversation context and produces a design brief. Do NOT interview the user; just synthesize what you already know.

The issue tracker, triage label vocabulary and design folder should have been provided to you. If not, tell the user to run `/setup-design-skills`.

If the user passes a link to a brief whose body is already written, you are updating it: follow **Updating a brief** below instead.

## Process

1. Gather what you need, if you haven't already: the PRD snapshot grill-prd saved at `briefs/<brief-slug>-prd.md` in the design folder, the brief's `needs-alignment` sub-issues (open and closed, with their answers), the glossary, and `personas/index.md`. Open only the persona files this brief serves. Use the glossary's words throughout the brief.

2. Write the brief using the template below, then publish it to the project issue tracker. grill-prd usually created the brief already: an issue labelled `design-brief` whose body is only the PRD source link. Replace that body with the brief, keeping the source link at the top. If there is no brief yet, create the issue with the `design-brief` label. With local markdown, the brief is `briefs/<brief-slug>.md` in the design folder.

<brief-template>

## Problem Statement

The problem the users are facing, from their perspective.

## Users

The personas this brief serves, by persona name, each with the goal or need of theirs it touches.

## User Stories

A LONG, numbered list of user stories. Each user story should be in the format of:

1. As a <persona>, I want <thing>, so that <benefit>

<user-story-example>
1. As a field tech, I want to sign in with a one-time code or my password, so that I can get in without email on site
</user-story-example>

The actor is always a persona from the persona index. This list of user stories should be extremely extensive and cover all aspects of the design.

## Constraints

What the design must work within: platform, technical limits, deadlines, existing patterns it must match, accessibility needs from the personas. Name breakpoints only when this brief changes the defaults in `FIGMA_STANDARDS.md` (for example "mobile is out of scope").

## Success Criteria

How we'll know the design worked, from the users' side and the business's.

## Design Scope

The PRD items marked **yours** or **needs alignment** in grill-prd. For everything else the PRD covers and who owns it, link the PRD snapshot.

## Out of Scope

What this release won't do: anything the PRD or your team ruled out, each with the reason, so nobody asks again. Not-yours items don't go here: they still ship, and the PRD snapshot keeps them.

## Open Questions

A link to each open `needs-alignment` sub-issue, or "None."

</brief-template>

## Updating a brief

Use this when scope has changed (usually after re-running grill-prd on a new PRD draft).

1. Read the current brief: its full body, comments and sub-issues.
2. Rewrite the full body using the template above, with the change folded into every section it touches. Keep everything the change doesn't touch.
3. Show the user only what changed, section by section: each changed line before and after, like a diff. Iterate until they approve.
4. Update the issue with the new body, then add a comment saying what changed and why. With local markdown, overwrite the file and add the same note at the end under `## Changes`, dated.
