# Figma standards

This project's Figma rules. `implement-ux-brief` checks against them while building, and `ux-review` reports any frame that breaks one as a hard violation. Keep each rule short and checkable.

## Library and tokens

- Build from library components. Detach only with a note on the frame saying why.
- Bind every colour, type style, spacing and radius to a library variable or style. No raw values.
- Bind to the token named for the role, not one that merely has the right value. A drag source isn't disabled, so it doesn't use `opacity/disabled`.

## Naming

- Frames are named `<Flow> / <Screen> / <State>`, using the glossary's words.
- Layers that a developer will look for are named for what they are, not `Frame 12`.

## Layout

- Use auto layout for stacks and lists, and Figma's grid layout or layout grids where content sits in rows and columns. Pick whichever matches how the layout should respond.
- Design at these breakpoints unless the brief's non-functional requirements change them (for example "mobile is out of scope"):
  - <name>: <width>px

## Copy

- Real copy in the glossary's words, never lorem ipsum.

## Accessibility

- Text meets WCAG AA contrast against its background.
- Touch targets are at least 44 by 44.
