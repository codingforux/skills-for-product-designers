# Issue tracker: GitLab

Briefs, parked questions and tickets for this product live as GitLab issues. Use the [`glab`](https://gitlab.com/gitlab-org/cli) CLI for all operations.

**Repo**: `<group>/<project>`. Pass `-R <group>/<project>` when the design folder isn't inside a clone of it; inside a clone, `glab` infers it from `git remote -v`.

## Conventions

- **Create an issue**: `glab issue create --title "..." --description "..."`. Use a heredoc for multi-line descriptions.
- **Read an issue**: `glab issue view <number> --comments`. Use `-F json` for machine-readable output.
- **List issues**: `glab issue list -F json` with appropriate `--label` filters.
- **Comment on an issue**: `glab issue note <number> --message "..."`. GitLab calls comments "notes".
- **Apply / remove labels**: `glab issue update <number> --label "..."` / `--unlabel "..."`. Multiple labels can be comma-separated or by repeating the flag.
- **Close**: `glab issue close <number>`. `glab issue close` does not accept a closing comment, so post the explanation first with `glab issue note <number> --message "..."`, then close.

## When a skill says "publish to the issue tracker"

Create a GitLab issue.

## When a skill says "fetch the relevant ticket"

Run `glab issue view <number> --comments`.

## Brief operations

The **brief** is a parent issue; its parked questions and its tickets are **child** issues of it.

- **Brief**: an issue labelled `design-brief`. `glab issue create --label design-brief`. (On GitLab tiers with native epics, an epic may hold the brief instead; a labelled issue works everywhere.)
- **Child issue**: an issue carrying `Part of #<brief>` at the top of its description, also added to a task list in the brief's description.
- **Parked question**: a child labelled `needs-alignment`, titled as the question. When your team answers, post the answer as a note, then close it. Open means waiting on the PM; closed means settled, and the last note is the answer.
- **Ticket**: a child labelled `ready-for-design-agent` (or `ready-for-human`); `ready-for-designer-review` once designed and waiting for the user, created blockers first.
- **Blocking**: GitLab's **native blocking link**, added with the `/blocked_by #<n>` quick action posted as a note (`glab issue note <child> --message "/blocked_by #<blocker>"`). Native blocking links are a Premium/Ultimate feature; on the free tier fall back to a `Blocked by: #<n>, #<n>` line at the top of the description. A ticket is unblocked when every blocker is closed.
