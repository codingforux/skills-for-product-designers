---
name: figma-mcp
description: Playbook for working in Figma through the Figma MCP. Use before your first Figma MCP call, whether you read frames or change a file, or when you hand Figma work to another agent.
---

# Figma MCP

Figma's own skills and tool descriptions govern how to call each tool: batching, validating a write, recovering from an error. This playbook adds what they leave to the team: the account, the **call budget** and the scope. Writes can't be undone with git, so follow it on every Figma job.

Read the UX folder config (written by setup-codingforux-skills) for the Figma account, the library file keys, and where design files go. Read `FIGMA_MCP_FINDINGS.md` in the UX folder too, if it exists: this team's own lessons about the Figma MCP. Which tokens to use is the design system docs' and `FIGMA_STANDARDS.md`'s call, not this skill's.

When you hand the work to another agent, name this skill instead of restating it, and add the account and the file keys.

## Before the first call

1. **Account.** Use the account the config or your task names. When the connector asks, answer with that account instead of stopping. Run `whoami` (free) to confirm the seat and plan.
2. **Budget.** The plan that owns the file, and your seat on it, set a daily and a per-minute call limit. Reads count toward it; Figma's [rate limits page](https://developers.figma.com/docs/figma-mcp-server/rate-limits-access/) has the numbers and the tools it exempts. Estimate the job's calls up front, and stop cleanly with saved progress before the limit, never midway through a write batch. A bridge plugin in the Figma desktop app is outside the limit: skip this step when the job runs through one.
3. **Scope.** Read the frames your task links, and change only what the brief or ticket asks for. Report anything else you find; don't change it.

## During the job

- **Read each frame once.** Keep what you need in your notes, so a later step reuses it instead of calling again.
- **Change main components before instances.** Instances inherit the change, which leaves only the true overrides to touch.
- **After a timeout, inspect before replaying.** Part of the batch may have been applied.
- **Never publish.** The library owner publishes the library.
