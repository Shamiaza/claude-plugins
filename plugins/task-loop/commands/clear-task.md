---
description: "Clear the current task reference"
---

Clear the current task reference by removing `.claude/current-task.md`.

```bash
if [ -f .claude/current-task.md ]; then
  rm .claude/current-task.md
  echo "✓ Current task reference cleared"
else
  echo "No active task reference found"
fi
```

This should be run when:
- A task is completed and you want to stop session reminders
- You want to switch to a different task without the old reference
- You're cleaning up after finishing work on a project
