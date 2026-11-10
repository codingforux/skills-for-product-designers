---
name: ux-review
description: "Review Figma frames along four axes: System (do they follow this product's documented standards and library?), Brief (do they deliver the ticket's or brief's user stories and requirements?), Completeness (are the states and edge cases designed?) and Experience (can each persona get through their stories easily?). Runs the four reviews in parallel sub-agents and reports them side by side. Use when the user wants to review a Figma page, frames, or work in progress against a ticket or brief."
---

Four-axis review of the Figma frames the user supplies:

- **System**: do the frames follow `FIGMA_STANDARDS.md`, the library and its tokens, the design system docs, and the naming rules?
- **Brief**: do the frames deliver the user stories and requirements in the ticket or brief?
- **Completeness**: are the states and edge cases designed, not just the happy path?
- **Experience**: can each persona get through their user stories easily, seeing what they need and knowing what to do next?

All four axes run as **parallel sub-agents** so they don't pollute each other's context, then this skill aggregates their findings. Every Figma read goes through the Figma MCP: call the Skill tool with "figma-mcp" before your first Figma call, and tell each sub-agent to do the same.

The issue tracker and UX folder should have been provided to you. If the UX folder config is missing, tell the user to run `/setup-codingforux-skills`.

## Process

### 1. Pin the frames

The target is whatever you were given: a Figma page or frames, linked by the user or passed in by the skill that called you. If there's none, ask the user.

Before going further, confirm the link resolves and holds at least one frame. A bad link or an empty page should fail here, not inside four parallel sub-agents.

### 2. Identify the brief source

Look for the ticket or brief, in this order:

1. A ticket or brief the user passed as an argument, fetched via the tracker in the UX folder config.
2. A ticket named in the conversation.
3. If nothing is found, ask the user. If they say there isn't one, the **Brief** sub-agent will skip and report "no brief available".

For a ticket, also fetch its parent brief: the ticket lists which user stories and requirements it covers, the brief holds them in full. Note the personas the brief names: the Experience sub-agent opens their files.

### 3. Identify the standards sources

From the UX folder: `FIGMA_STANDARDS.md`, the glossary, the library file keys in the config, and the design system docs, if any.

On top of those, the Completeness axis always carries the **completeness baseline** below. Where `FIGMA_STANDARDS.md` or the brief requires a state, a missing one is a hard violation; otherwise each gap is a judgement call.

Match each item against the frames:

- **Edge cases**: the unusual but valid inputs and paths each user story allows.
- **Empty, loading and error states**: for every screen or component that shows data or waits on something.
- **Long content**: long names, long text, many items, large numbers.
- **Copy**: proofread every string, and check it uses the glossary's words.
- **Permissions and roles**: what each role sees or can't do.
- **First-run vs returning user**: the first visit, with nothing set up, and the later ones.
- **Destructive actions**: each delete, remove or irreversible step has a confirmation.

The Experience axis carries the **walkthrough** below. No written standard stands behind it, so every finding is a judgement call.

Walk each user story as its persona, frame by frame, reading a screenshot of each frame as that person would:

- **First look**: what the eye lands on first, and whether that is what this persona needs for this story.
- **Next step**: whether the action that moves the story on is obvious, and whether one action leads.
- **Effort**: the steps, fields and decisions the story takes, and anything asked for that the product already knows.
- **Hesitation**: where the persona would stop to work something out: an unclear label, two options that look alike, feedback that never comes.
- **Recovery**: after a slip, whether they can see what happened and get back.
- **Context of use**: whether it holds up where the persona file says they use it: the device, the hurry, the conditions.

### 4. Spawn all four sub-agents in parallel

**System sub-agent prompt** should include:

- The Figma link.
- The paths to `FIGMA_STANDARDS.md` and the glossary, the library file keys, and where the design system docs are, if any.
- The task: "Report, per frame where relevant, every place the frames break a written standard: cite the standard (file + the rule). Check that components come from the library and are used as the design system docs say, values are bound to library tokens, and layers and components follow the naming rules. Distinguish hard violations (breaks a written standard) from judgement calls. Under 400 words."

**Brief sub-agent prompt** should include:

- The Figma link.
- The fetched ticket and brief.
- The task: "Report: (a) user stories the ticket covers that are missing or partial in the frames; (b) acceptance criteria and requirements (functional, and the brief's non-functional ones) that the frames break; (c) screens or behaviour that weren't asked for (scope creep); (d) stories that look designed but where the design looks wrong for the story. Quote the user story or requirement for each finding. A miss against the brief is a hard violation; anything else is a judgement call. Work from the brief alone, without opening persona files. Under 400 words."

**Completeness sub-agent prompt** should include:

- The Figma link.
- The fetched ticket and brief, and the paths to `FIGMA_STANDARDS.md` and the glossary.
- **The completeness baseline from step 3** pasted in full, with its two rules (the sub-agent has no other access to it).
- The task: "Report each baseline item that is missing or thin, per frame where relevant. Mark each finding hard violation or judgement call by the baseline's rules. Under 400 words."

**Experience sub-agent prompt** should include:

- The Figma link.
- The fetched ticket and brief, and the paths to the persona files the brief names.
- **The walkthrough from step 3** pasted in full (the sub-agent has no other access to it).
- The task: "Walk each user story the frames cover as its persona, with a screenshot of each frame. For each story, report at most three findings, the ones that would most change the design, each in one or two sentences: the frame, what the persona experiences there, and one change that would fix it. End each story with one line on what works and should survive a redesign. Every finding is a judgement call. Leave out anything a written standard or the brief already decides: the other axes report those."

If the brief is missing, skip the Brief sub-agent and note this in the final report. The Experience sub-agent then walks the flow the frames show as a first-time user, and states the task it assumed.

### 5. Aggregate

Present the four reports under `## System`, `## Brief`, `## Completeness` and `## Experience` headings, verbatim or lightly cleaned. Do **not** merge or rerank findings, because the axes are deliberately separate (see _Why four axes_).

End with a one-line summary: hard violations and judgement calls per axis, and the worst issue _within each axis_ (if any). Don't pick a single winner across axes: that's the reranking the separation exists to prevent.

Report in chat. Post the findings as Figma comments only when the user asks.

## Why four axes

Frames can pass one axis and fail another:

- Frames that follow every standard but design the wrong thing → **System pass, Brief fail.**
- Frames that deliver every story but break the standards → **Brief pass, System fail.**
- Frames that do both but only show the happy path → **System and Brief pass, Completeness fail.**
- Frames that pass all three but leave the persona hunting for the next step → **Experience fail.**

Reporting them separately stops one axis from masking another.

The first three axes check the frames against something written. Experience is the critique: it has only judgement calls, so it informs the designer's decision and nothing is fixed from it without one.
