---
name: figma-writes
description: Playbook for writing to Figma through the Figma MCP. Use whenever you change a Figma file (frames, components, variables, bindings), or hand that work to another agent.
---

# Figma Writes

Every Figma write spends a limited **call budget** and can't be undone with git. Follow this playbook on every job.

Read the UX folder config (written by setup-codingforux-skills) for the Figma account, the library file keys, and where design files go. Read `FIGMA_MCP_FINDINGS.md` in the UX folder too, if it exists: this team's own lessons about the Figma MCP. Which tokens to use is the design system docs' and `FIGMA_STANDARDS.md`'s call, not this skill's.

When you hand the work to another agent, name this skill instead of restating it, and add the account, the file keys and the name of any version you saved.

## Before the first call

1. **Account.** Use the account the config or your task names. When the connector asks, answer with that account instead of stopping. Run `whoami` (free) to confirm the seat and plan.
2. **Budget.** The plan that owns the file sets a call limit. Estimate the job's calls up front, and stop cleanly with saved progress before the limit, never midway through a write batch.
3. **Scope.** Change only what the brief or ticket asks for. Report anything else you find; don't change it.
4. **Named version.** If the file already has content, save a named version to its version history before your first write, so the user can restore the whole file in one click: run `await figma.saveVersionHistoryAsync("Before <brief or ticket>")` through `use_figma`, and name the version in your report. If that call fails, ask the user to save a version in Figma (File > Save to version history) and wait until they have. Skip this step when your task says the named version for this job is handled.

## Writing

- **Batch writes**: many nodes per call, main components before instances.
- **After a timeout, inspect before replaying.** Part of the batch may have been applied.
- **Read back after the last write.** Confirm what changed before you report it done.
- **Never publish.** The library owner publishes the library.
