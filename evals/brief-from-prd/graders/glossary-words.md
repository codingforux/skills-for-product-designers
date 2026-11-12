---
type: regex
target: { source: file, path: docs/ux/briefs/team-invites.md }
# The avoided word, used as the product's name for the thing. A quoted mention
# is allowed, so the brief can carry "the word 'organization' appears nowhere".
pattern: '(?<!["“''`])\borganizations?\b'
flags: i
match: not_contains
---
