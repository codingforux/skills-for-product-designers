---
name: figma-mcp
description: Playbook for working in Figma through the Figma MCP. Use before your first Figma MCP call, whether you read frames or change a file, or when you hand Figma work to another agent.
---

# Figma MCP

Every Figma MCP call, read or write, spends a limited **call budget**, and writes can't be undone with git. Follow this playbook on every Figma job.

Read the UX folder config (written by setup-codingforux-skills) for the Figma account, the library file keys, and where design files go. Read `FIGMA_MCP_FINDINGS.md` in the UX folder too, if it exists: this team's own lessons about the Figma MCP. Which tokens to use is the design system docs' and `FIGMA_STANDARDS.md`'s call, not this skill's.

When you hand the work to another agent, name this skill instead of restating it, and add the account and the file keys.

## Before the first call

1. **Account.** Use the account the config or your task names. When the connector asks, answer with that account instead of stopping. Run `whoami` (free) to confirm the seat and plan.
2. **Budget.** The plan that owns the file sets a call limit, and reads count toward it. Estimate the job's calls up front, and stop cleanly with saved progress before the limit, never midway through a write batch.
3. **Scope.** Read the frames your task links, and change only what the brief or ticket asks for. Report anything else you find; don't change it.

## Reading

- **Read by node.** Pass the frame's node id from its link, so a call returns that frame and not the whole page or file.
- **Read each frame once.** Keep what you need in your notes, so a later step reuses it instead of calling again.

## Writing

- **Batch writes**: many nodes per call, main components before instances.
- **After a timeout, inspect before replaying.** Part of the batch may have been applied.
- **Read back after the last write.** Confirm what changed before you report it done.
- **Never publish.** The library owner publishes the library.
