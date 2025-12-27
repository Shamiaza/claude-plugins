# Task Loop Plugin

Long-running task execution loop with agent orchestration for Claude Code.

## Features

- **Agent Orchestration**: Automatically selects the right agent (Flutter, NestJS, React, Angular) based on file patterns
- **Progress Tracking**: Maintains state in a progress file for resumption across sessions
- **Code Review**: Runs code-reviewer after every implementation step
- **Context-Aware**: Handles context exhaustion gracefully by saving state
- **Multi-Task Support**: Can process 100+ tasks sequentially

## Installation

```bash
claude plugins:add github:Shamiaza/claude-plugins
```

## Usage

### Basic Usage

```bash
/task-loop:loop todo/feature.md
```

### With Custom Progress File

```bash
/task-loop:loop todo/feature.md --progress docs/feature-progress.md
```

### With Iteration Limit

```bash
/task-loop:loop todo/big-refactor.md --max-iterations 50
```

## How It Works

1. **Initialize**: Reads task file and creates progress file
2. **Analyze**: Breaks task into atomic steps
3. **Execute**: For each step:
   - Selects appropriate agent based on file type
   - Implements the step
   - Updates progress with notes
   - Runs code review
   - Fixes any issues
   - Marks step complete
4. **Resume**: On new session, continues from last incomplete step

## Agent Selection

| File Pattern | Agent |
|--------------|-------|
| `.dart`, `lib/`, `crm-fe/` | flutter-senior-dev |
| `.ts` (backend), `crm-be/` | nestjs-backend-architect |
| `.tsx`, `.jsx` | react-senior-dev |
| `.component.ts` | angular-logic-developer |
| Other | general-purpose |

## Progress File Format

```markdown
---
task: todo/feature.md
started: 2024-01-15T10:00:00Z
status: in_progress
current_step: 3
total_steps: 5
---

# Task Progress

## Steps

### Step 1: Create data model
- Status: completed
- Agent: nestjs-backend-architect
- Notes: Created User entity with validation

### Step 2: Add API endpoint
- Status: completed
- Agent: nestjs-backend-architect
- Review: Passed

### Step 3: Create UI component
- Status: in_progress
- Agent: react-senior-dev
```

## Monitoring

```bash
# View loop state
cat .claude/task-loop.local.md

# View task progress
cat <progress-file>
```

## Best Practices

1. **Clear Task Files**: Write detailed task descriptions
2. **Atomic Steps**: Let the loop break tasks into small, focused steps
3. **Review Progress**: Check the progress file periodically
4. **Resume Gracefully**: Start new sessions with the same command to resume

## License

MIT
