---
name: agent-retro
description: "Conduct a retrospective on an agent design session."
disable-model-invocation: true
---

The user has asked for a **retrospective**. You are suggesting improvements to the design agent's **environment** to improve future runs.

## Steps

1. Call the Skill tool with `writing-for-agents` for the writing style guide.

2. Read the primary sources for the session the user specifies. This may mean searching through session logs on this machine. If the user doesn't specify a session, default to the current one.

3. Look for candidates for improvement in these categories.

- **Navigation**: how easy was it for the agent to find the right file, page or frame? Would a **navigation pointer** (a frame link on a ticket, a path in the config) make it easier? _Use when_ the session took a long time to find something, or searched a Figma file.
- **Standards**: should **design-review** be given a new rule to enforce? Should an existing rule in `FIGMA_STANDARDS.md` be removed or clarified? _Use when_ design-review failed to catch a mistake, or the user corrected something a rule should have covered.
- **Design system**: did the agent pick the wrong component or pattern, or rebuild one the library already has? The fix goes in the design system docs. _Use when_ the user corrected a component or pattern choice.
- **Words**: did the agent use a word the product doesn't, or miss a new one? The fix goes in the glossary. _Use when_ the user corrected wording.
- **Tool economy**: did the agent make expensive or failed Figma MCP calls that could be streamlined? The fix goes in `FIGMA_MCP_FINDINGS.md`. _Use when_ a call timed out, hit a limit, returned a partial result, or had to be retried.
- **Global AGENTS.md**: are there any steering instructions that should be moved to the design folder files instead? _Use when_ the AGENTS.md or CLAUDE.md file is particularly large, in the project OR the user's global scope.
- **No-ops**: look for instructions in steering files that don't modify the agent's behavior. _Use when_ the steering files are large and unwieldy.
- **Information access**: look for opportunities to increase the agent's access to information: a connector, a linked doc, research it couldn't reach. _Use when_ a crucial piece of information was not available to the agent.

4. Present these candidates to the user, in order of severity. Name the file each one changes and the exact line to add, change or remove.

5. Write only the ones the user approves.

## Reference

### Building vs Review

Remember that all work goes through two stages: building and review. The building agent has the most **context pressure**. It is responsible for exploration, designing frames, and recovering from failed Figma calls.

The review agent (design-review) has the least context pressure: it receives frames, so no exploration needed, and it doesn't build.

This means design-review should be responsible for enforcing standards, not the building agent. Prefer a rule design-review checks over a new instruction in the build path.

### Files

All in the design folder (`docs/design/`), except the design system docs, which live wherever the config points:

- `CLAUDE.md`/`AGENTS.md`: these files are pushed to the context window of any agent working here. They should be used incredibly sparingly, usually only for **navigation pointers** to other files.
- `FIGMA_STANDARDS.md`: the rules design-review enforces. Building agents read it too.
- Design system docs: which component or pattern to use, and when.
- Glossary: the product's own words.
- `FIGMA_MCP_FINDINGS.md`: lessons about working through the Figma MCP, read before every Figma job.
- Skills: don't edit the design skills themselves. If one needs changing, say so to the user.
