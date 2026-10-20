# Design config

How the design skills find this product's design files and Figma files.

## Product

- **Product**: <name>
- **Design folder**: `docs/design/`
- **Design system docs**: `<where the team documents its design system: a folder, a registry, a docs site or another repo; or "none">`

## Figma

- **Account**: <the Figma account to use; when the connector asks, answer with this account instead of stopping>
- **Team**: `<plan key from whoami, e.g. team::123>`
- **Libraries**: published by <owner> only; the agent never publishes them.
  - <name>: `<file key>` (<link>)
- **Design files go in**: one of
  - a project folder: `<project id>` (<link>). Each brief gets a new file here, named after the brief.
  - a product file: `<file key>` (<link>). Each brief gets its own pages in it.
- **Sync folder**: `<folder outside git for Figma restore points and reports, e.g. ~/Documents/figma-sync/>`

## In this folder

- **`FIGMA_STANDARDS.md`**: the project's Figma rules. Read it before building or reviewing frames.
- **`glossary.md`**: the product's own words. Use them in every brief, ticket, frame name and piece of copy.
- **`personas/`**: one file per persona, plus `index.md` with one line each. Open these only when your skill says to, and only the personas the work affects.
- **`briefs/`**: briefs, PRD snapshots, questions and tickets, when the issue tracker is local markdown.

If any of these files don't exist, **proceed silently**. Don't flag their absence.

<!-- Master-plus-products only. Delete this section for a single product. -->
## Shared

- **Shared standards and glossary**: `<path to the master's design folder>`. Read its `FIGMA_STANDARDS.md` and `glossary.md` first, then this folder's, which hold only this product's additions. Where they disagree, the shared rules win: follow them and flag the product's file to the owner.

<!-- In the master's own config only: one row per product. Add a row when a product is first worked on. -->
## Products

| Product | Design folder | Figma folder or file | Account | Design system docs |
| ------- | ------------- | -------------------- | ------- | --------- |
| <name>  | `<path>`      | `<id or key>`        | <name>  | `<path>`  |
