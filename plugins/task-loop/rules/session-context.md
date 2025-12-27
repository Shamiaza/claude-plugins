---
description: "Auto-load current task context on session start"
---

# Session Context: Current Task

When starting a new session in a project with an active task loop:

1. Check if `.claude/current-task.md` exists
2. If it exists, read it to understand the current task context
3. Read the progress file referenced to see current status
4. Offer to resume with `/task-loop:loop` or continue manually

This ensures continuity between sessions.
