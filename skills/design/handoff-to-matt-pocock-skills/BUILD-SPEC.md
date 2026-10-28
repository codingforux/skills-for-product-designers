# Build spec

The **build spec** is Matt's spec without the half the brief already holds. It points at the brief for the problem, users, user stories, requirements and out of scope, and writes only what the code adds: implementation and testing decisions. It becomes the parent issue `/to-tickets` slices and `/code-review` checks the code against. The test seams are an engineering call, so it works best with the engineer who'll own the build in the session.

1. **Explore the code** the brief touches, if you haven't. Use `CONTEXT.md`'s words for code and respect the ADRs in the area. Done when every user story and functional requirement maps to the modules it changes, or to "no code change".

2. **Sketch the test seams**: where the feature will be tested. Prefer existing seams, at the highest point you can, as few as possible; one is ideal. Check them with the user. Done when they agree.

3. **Write the build spec** with the template below, in the glossary's words for anything the user sees. Leave out file paths and code snippets: they go stale. Show it and iterate until the user approves.

4. **Publish** it to the tracker Matt's setup chose, labelled `ready-for-agent`, as `/to-spec` would. Comment its link on the brief.

5. **Hand over.** Tell the user to run `/to-tickets` with the build spec's link next, in this session, so the brief and frames stay in context while it slices. Then `/implement`, as Matt's `/ask-matt` lays out.

<build-spec-template>

## Source

The brief, the Figma file and the PRD snapshot, as links. Then this line, word for word: "The brief is the source of truth for the problem, users, user stories with their acceptance criteria, requirements (R and N) and out of scope. Read it in full before slicing, building or reviewing."

## Design Decisions

From the handoff: components and their code mappings, new components, tokens, interactions, copy and breakpoints, each with its frame links.

## Implementation Decisions

- The modules that will be built or changed, and their interfaces
- Architectural decisions
- Schema changes and API contracts
- Technical clarifications from the engineer

## Testing Decisions

- The agreed test seams
- Which modules will be tested, and the prior art for those tests in the codebase
- What makes a good test here: external behaviour, not implementation details

## Coverage

Every user story and functional requirement by its number, one line each, with the modules or decisions that deliver it. Non-functional requirements bind every ticket: list only those with a code consequence.

## Open

From the handoff: open questions and judgement calls, each with what it blocks, or "None."

</build-spec-template>
