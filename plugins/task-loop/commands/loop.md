---
description: "Long-running task loop with agent orchestration"
argument-hint: "<task-file> [--progress <file>] [--max-iterations N]"
---

[[ Ultrathink ]]

Run the task-loop setup script to initialize:

```bash
$PLUGIN_DIR/scripts/setup-task-loop.sh $ARGUMENTS
```

Then execute the task-loop workflow:

1. Read task and progress files
2. Break task into atomic steps (update progress file)
3. For each step:
   - Select agent by file type (flutter/nestjs/react/angular/general)
   - Implement with agent
   - Update progress with notes
   - Run code-reviewer
   - Fix issues if any
   - Mark step complete
4. On context limit: save full state to progress file, mark "paused"
5. On resume: read progress, continue from last incomplete step

## Agent Selection Rules

| Pattern | Agent |
|---------|-------|
| `crm-fe/`, `lib/`, `.dart` | flutter-senior-dev |
| `crm-be/`, `src/domain/`, `.ts` (backend) | nestjs-backend-architect |
| `.tsx`, `.jsx`, React | react-senior-dev |
| `.component.ts`, Angular | angular-logic-developer |
| Tests, TDD | tdd agents (red->green->refactor) |
| Other | general-purpose |

## Critical Rules

1. **Always update progress file** after every action
2. **Never skip reviews** - run code-reviewer after every implementation
3. **Atomic commits** - one logical change per step
4. **Resume-friendly** - all state lives in progress file
5. **Parallel when possible** - spawn multiple read-only agents concurrently
6. **Stop on blockers** - mark step as blocked, document why, move to next

## Session Continuity

This command creates `.claude/current-task.md` with references to:
- Current task file path
- Progress file path
- Last update timestamp

On new sessions, check this file to resume work:
```bash
cat .claude/current-task.md
```

The plugin hooks will:
- Notify you when an active task is detected (on first Read)
- Remind you to update progress after each Task agent
