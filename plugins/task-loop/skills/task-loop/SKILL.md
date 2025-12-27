---
name: task-loop
description: Long-running task execution loop with agent orchestration. Spawns code agents per task step, runs review/QA after each session, tracks progress in a file. Resumes from last checkpoint on context exhaustion. Handles single tasks or lists of 100+ tasks.
---

# Task Loop

Autonomous task execution with agent orchestration and progress tracking.

## Invocation

```
/task-loop:loop <task-file> [--progress <file>] [--max-iterations N]
```

## Workflow

### 1. Initialize

Read task file. If no `--progress` file, create `<task-name>-progress.md`. Parse tasks into atomic steps.

### 2. Execute Loop

For each incomplete step:

1. **Read Progress** - Load state from progress file
2. **Select Agent** - Choose based on task type:
   - Flutter -> `flutter-senior-dev`
   - NestJS -> `nestjs-backend-architect`
   - React -> `react-senior-dev`
   - Angular -> `angular-logic-developer`
   - General -> `general-purpose`
3. **Implement** - Run agent on current step
4. **Update Progress** - Mark step status, add notes
5. **Review Cycle** - Always run after implementation:
   - `code-reviewer` for quality
   - `code-refactor-specialist` if issues found
   - Update progress with review outcome
6. **Iterate** - Continue until all steps complete

### 3. Resume Protocol

On new session, read progress file first. Find last incomplete step. Resume from there. All context is in the progress file.

## Progress File Format

```markdown
---
task: <original-task-file>
started: <ISO-date>
status: in_progress | completed
current_step: <N>
total_steps: <N>
last_updated: <ISO-date>
---

# Task Progress

## Original Task
<copied from source>

## Steps

### Step 1: <description>
- Status: pending | in_progress | completed | blocked
- Agent: <agent-used>
- Started: <ISO-date>
- Completed: <ISO-date>
- Notes: <implementation notes>
- Review: <review outcome>

### Step 2: ...
```

## Agent Selection Rules

| Pattern | Agent |
|---------|-------|
| `crm-fe/`, `lib/`, `.dart` | flutter-senior-dev |
| `crm-be/`, `src/domain/`, `.ts` (backend) | nestjs-backend-architect |
| `.tsx`, `.jsx`, React | react-senior-dev |
| `.component.ts`, Angular | angular-logic-developer |
| Tests, TDD | tdd agents (red->green->refactor) |
| Other | general-purpose |

## Multi-Task Mode

For task lists (>1 task), process sequentially. Update master progress file with:
- Overall completion percentage
- Current task index
- Per-task status

## Critical Rules

1. **Always update progress file** after every action
2. **Never skip reviews** - run code-reviewer after every implementation
3. **Atomic commits** - one logical change per step
4. **Resume-friendly** - all state lives in progress file
5. **Parallel when possible** - spawn multiple read-only agents concurrently
6. **Stop on blockers** - mark step as blocked, document why, move to next

## Context Exhaustion

Before context limit:
1. Write full state to progress file
2. Mark current step as "paused"
3. Include resume instructions in notes

Next session reads progress file and continues.
