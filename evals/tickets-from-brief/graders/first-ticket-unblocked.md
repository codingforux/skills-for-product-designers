---
type: regex
target: trace
# The write of ticket 01 says nothing blocks it. The trace is JSON, one message
# per line, so the path and the file's content sit on the same line.
pattern: 'tickets/01-[a-z0-9-]+\.md[^\n]*Blocked by:[^\n]{0,12}None'
---
