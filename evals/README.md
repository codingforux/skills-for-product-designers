# Evals

Behaviour tests for the skills, run with `claude plugin eval`. Each case sends a prompt to a fresh session with only this plugin loaded, then grades what came back.

Run them before a release that changes a skill's behaviour:

```bash
claude plugin eval . --scaffold --allow-tools Write Edit
```

`--scaffold` lets each case's `fixture.sh` seed the workspace, and the `Write` and `Edit` grants let the skills publish to the local markdown tracker. A full run with the no-plugin baseline costs model usage on your account; add `--runs 1 --ablation none` for a quick, cheap pass.

## Cases

| Case | Skill | What it checks |
| --- | --- | --- |
| `router-prd-first` | ask-codingforux | Someone holding a fresh PRD is sent to grill-prd first. |
| `brief-from-prd` | to-ux-brief | A marked PRD snapshot and an answered question become a brief: template sections, persona actors, numbered requirements, the answer folded in, the glossary's words, out-of-scope reasons. |
| `tickets-from-brief` | to-ux-tickets | A brief splits into one file per ticket, the happy path first and unblocked, every later ticket a path and not a layer. |

`_fixtures/ux-folder.sh` is the UX folder every case shares: a config, a local markdown tracker, labels, a glossary with avoided words, and two personas.

## What isn't covered yet

- **Skills that work in Figma** (ux-review, implement-ux-brief, explore-variants, wrap-up-figma-file). They need a Figma fixture file with planted violations, and a way to replay its MCP answers so a run doesn't spend the call budget.
- **Interviews** (grill-prd, setup-codingforux-skills). A run can't answer questions, so these need a recorded conversation to resume.

## Adding a case

One folder per case: `prompt.md`, `graders/*.md`, and `case.yaml` plus `fixture.sh` when it needs files. Prefer `regex`, `file_exists` and `tool_used` graders, which cost nothing and give the same answer every time; keep `llm` graders for short text with concrete PASS and FAIL conditions. The user-invoked skills are started by their slash command at the top of the prompt.

No project instructions load in a run, so a prompt names the UX folder's files itself.
