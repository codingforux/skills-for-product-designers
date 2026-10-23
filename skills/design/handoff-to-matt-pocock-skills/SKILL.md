---
name: handoff-to-matt-pocock-skills
description: "Optional: hand a designed UX brief and its Figma frames to Matt Pocock's engineering skills, starting with /to-spec. Needs the mattpocock-skills plugin."
disable-model-invocation: true
---

# Handoff to Matt Pocock skills

Optional, for teams that build with Matt Pocock's engineering skills (the `mattpocock-skills` plugin). Nothing else in this plugin needs it.

This skill writes the **handoff**: the UX brief and its approved Figma design, laid out in the conversation for his skills to pick up. His `/to-spec` synthesises the conversation without interviewing anyone, so the handoff is its only view of the design: whatever is missing from it never reaches the code.

## Steps

1. **Check Matt's skills are set up here.** His skills explore the codebase and publish to the tracker his setup chose, so this session runs in the code repo, whose `CLAUDE.md` or `AGENTS.md` holds his `## Agent skills` block. If `/to-spec` isn't among your skills, or that block is missing, tell the user to install `mattpocock-skills` and run `/setup-matt-pocock-skills` in the code repo, then stop. Done when both are there.

2. **Read the brief.** Take the brief's link from the user. Read its body and comments, every ticket with its latest frame link, and each closed `needs-alignment` question with its answer. When the UX folder (`docs/ux/`) is in this repo, read its issue tracker file and glossary first; when it lives elsewhere, read the issues through the link. Done when every ticket has a frame link or is listed as missing one.

3. **Check the design is approved.** Approved means every ticket is closed and no `needs-alignment` question is open. List anything still open with what it blocks, and ask the user whether to hand off now with those marked open, or stop. Done when everything is closed or the user chose to go on.

4. **Read the frames.** Read the frames the tickets link through the Figma MCP, and only those; if `docs/ux/FIGMA_MCP_FINDINGS.md` is here, read it first. This skill only reads Figma. From each frame, collect what an engineer needs and the brief doesn't say:
   - the screens and states it shows (empty, loading, error, edge cases) and the user stories each covers
   - the library components it uses, with the code component Code Connect maps to each, if any, and anything built outside the library, which becomes new code
   - the variables and styles it binds, by name
   - the interactions and transitions between screens, and the copy, verbatim
   - the designer's annotations, and the judgement calls left from the last ux-review

   Done when every linked frame is read and every user story in the brief points at a frame or is marked undesigned.

5. **Write the handoff** in chat, in the glossary's words for anything the user sees:
   - **Problem** and **Users**, from the brief.
   - **User stories**: every one from the brief, personas kept as the actors, each with its frame links and the states designed for it.
   - **Design decisions**: components and their code mappings, new components, tokens, interactions, copy and breakpoints. These are the design's half of the spec's implementation decisions; modules, APIs, schema and test seams stay with `/to-spec` and the engineer.
   - **Out of scope**, from the brief.
   - **Open**: unapproved tickets, open questions and judgement calls.
   - **Links**: the brief, the Figma file and every frame.

   The UX tickets are design slices: leave them out of the handoff's structure, since the code tickets get sliced fresh from the spec. Show the handoff and let the user correct it. Done when they approve it.

6. **Hand over.** Tell the user to run `/to-spec` next, in this session, so it reads the handoff from the conversation. The spec becomes the parent issue that `/to-tickets` slices into code tickets and that `/code-review` checks the code against. Then `/to-tickets` and `/implement`, as Matt's `/ask-matt` lays out. Only when the brief is a single small slice, suggest `/implement` straight away instead.

   When the spec is published, comment its link on the brief, so anyone looking at the design can find the code work.
