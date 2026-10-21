# Issue tracker: GitHub

Briefs, parked questions and tickets for this product live as GitHub issues. Use the `gh` CLI for all operations.

**Repo**: `<owner>/<repo>`. Pass `-R <owner>/<repo>` when the design folder isn't inside a clone of it; inside a clone, `gh` infers it from `git remote -v`.

## Conventions

- **Create an issue**: `gh issue create --title "..." --body "..."`. Use a heredoc for multi-line bodies.
- **Read an issue**: `gh issue view <number> --comments`, filtering comments by `jq` and also fetching labels.
- **List issues**: `gh issue list --state open --json number,title,body,labels,comments --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'` with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`

## When a skill says "publish to the issue tracker"

Create a GitHub issue.

## When a skill says "fetch the relevant ticket"

Run `gh issue view <number> --comments`.

## Brief operations

The **brief** is a parent issue; its parked questions and its tickets are **sub-issues** of it.

- **Brief**: an issue labelled `design-brief`. `gh issue create --label design-brief`.
- **Sub-issue**: create the issue, then link it to the brief with `gh api --method POST repos/<owner>/<repo>/issues/<brief>/sub_issues -F sub_issue_id=<child-db-id>`, where `<child-db-id>` is the child's numeric **database id** (`gh api repos/<owner>/<repo>/issues/<n> --jq .id`, _not_ the `#number`). Where sub-issues aren't enabled, add the child to a task list in the brief body and put `Part of #<brief>` at the top of the child body.
- **Parked question**: a sub-issue labelled `needs-alignment`, titled as the question. When your team answers, `gh issue close <n> --comment "<answer>"`. Open means waiting on the PM; closed means settled, and the closing comment is the answer.
- **Ticket**: a sub-issue labelled `ready-for-design-agent` (or `ready-for-human`); `ready-for-designer-review` once designed and waiting for the user, created blockers first.
- **Blocking**: GitHub's **native issue dependencies**. Add an edge with `gh api --method POST repos/<owner>/<repo>/issues/<child>/dependencies/blocked_by -F issue_id=<blocker-db-id>`. Where dependencies aren't available, fall back to a `Blocked by: #<n>, #<n>` line at the top of the child body. A ticket is unblocked when every blocker is closed.
- **List a brief's sub-issues**: `gh api repos/<owner>/<repo>/issues/<brief>/sub_issues --jq '[.[] | {number, title, state, labels: [.labels[].name]}]'`.
