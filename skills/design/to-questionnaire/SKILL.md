---
name: to-questionnaire
description: Gather a brief's open needs-alignment questions into one questionnaire for your team, then close each question when the answers come back.
disable-model-invocation: true
---

Turn the questions only your team can answer into a **questionnaire**: one Markdown message the user sends to the people who can answer them (the PM, engineering, anyone else), who may never open the tracker. They hold knowledge the user lacks; the questionnaire pulls it out of them. The user sends it; you never contact anyone.

The design folder config (issue tracker, paths) should have been provided to you. If not, tell the user to run `/setup-design-skills`.

**Grill the send, not the subject.** The questions are already parked; interview the user only about the _send_, which they can always answer.

1. **Gather the open questions.** Read the brief (the user passes its link, or it's in the conversation) and every open sub-issue labelled `needs-alignment`. Done when you hold each open question with its context and the decisions waiting on it.

2. **Who is it going to, and how?** Ask, in one exchange, who it's going to (one person or the whole team), how much of the project they already know, how the user will send it (chat, email, a doc) and any deadline. This fixes the tone, the length and how much context it must carry. Done when you know all four.

3. **Write the questionnaire.** Draft one question per open sub-issue, following the Document structure below. Write it to `to-questionnaire-<slug>.md` in the current directory (slug from the brief) and report the path. Done when the file exists and every open `needs-alignment` sub-issue is covered by a question.

4. **Record the answers.** When the user brings the answers back, match each to its sub-issue. Close each answered sub-issue with the answer recorded, quoted as given, with who gave it. Leave a sub-issue open when the answer is partial or "I don't know", and tell the user which ones. Done when every answer is recorded. Then, if the answers change the PRD or a new draft arrives, offer to re-run `/grill-prd`; otherwise offer `/to-design-brief`.

## Document structure

Frame the document as a **discovery questionnaire**: the user lacks context, the team holds it. Order questions most-important-first, since async means you may only get one pass, and group them under `##` headings by theme once there are more than a handful. Write it using the template below.

<questionnaire-template>

# <Questionnaire title>

**Purpose:** why this questionnaire exists and the design decisions riding on it.

**From:** <the user>, **To:** <the recipients>, **How your answers will be used:** <where they go>

## Context

One paragraph orienting readers who weren't in the design session. Enough to answer well, not a page.

## How to answer

Deadline and rough effort. Partial answers and "I don't know" are useful: flag anything you're unsure of rather than skipping it.

## <Theme heading>

One `##` section per theme. Under each, its questions, most-important-first. Every question is one idea, never compound, with the sub-issue's reference in brackets after the question so answers map back, an answer stub directly beneath, and a one-line _why this matters_ only where the question could be misread or invite a throwaway answer.

<question-example>
### Can trial users invite teammates before they pay? (#14)

_Why this matters: it decides whether the invite flow needs a paywall step._

>
</question-example>

## Anything else?

A closing catch-all: anything we didn't ask that we should know?

</questionnaire-template>
