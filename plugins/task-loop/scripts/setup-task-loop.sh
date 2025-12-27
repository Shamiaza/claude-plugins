#!/bin/bash
# Task Loop Setup Script
# Initializes state for long-running task execution with agent orchestration

set -euo pipefail

TASK_FILE=""
PROGRESS_FILE=""
MAX_ITERATIONS=0

show_help() {
  cat << 'EOF'
Task Loop - Long-running task execution with agent orchestration

USAGE:
  /task-loop:loop <task-file> [OPTIONS]

ARGUMENTS:
  <task-file>    Path to task file (e.g., todo/feature.md or tasks/*.md for multiple)

OPTIONS:
  --progress <file>      Custom progress file (default: <task-name>-progress.md)
  --max-iterations <n>   Maximum iterations before auto-stop (default: unlimited)
  -h, --help             Show this help message

DESCRIPTION:
  Executes tasks autonomously using specialized agents:
  - Spawns code agents (flutter, nestjs, react, angular) per task step
  - Runs code-reviewer after each implementation
  - Tracks progress in a markdown file for resumption
  - Handles 100+ tasks efficiently

EXAMPLES:
  /task-loop:loop todo/auth-feature.md
  /task-loop:loop todo/refactor.md --max-iterations 50
  /task-loop:loop todo/big-feature.md --progress docs/progress.md

MONITORING:
  cat .claude/task-loop.local.md  # View loop state
  cat <progress-file>              # View task progress

STOPPING:
  Complete all tasks or reach --max-iterations
EOF
  exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      ;;
    --progress)
      [[ -z "${2:-}" ]] && { echo "Error: --progress requires a file path"; exit 1; }
      PROGRESS_FILE="$2"
      shift 2
      ;;
    --max-iterations)
      [[ -z "${2:-}" ]] && { echo "Error: --max-iterations requires a number"; exit 1; }
      [[ ! "$2" =~ ^[0-9]+$ ]] && { echo "Error: --max-iterations must be a positive integer"; exit 1; }
      MAX_ITERATIONS="$2"
      shift 2
      ;;
    *)
      [[ -z "$TASK_FILE" ]] && TASK_FILE="$1" || { echo "Error: Unknown argument: $1"; exit 1; }
      shift
      ;;
  esac
done

# Validate task file
[[ -z "$TASK_FILE" ]] && { echo "Error: No task file provided. Use: /task-loop:loop <task-file>"; exit 1; }
[[ ! -f "$TASK_FILE" ]] && { echo "Error: Task file not found: $TASK_FILE"; exit 1; }

# Generate progress file name if not provided
if [[ -z "$PROGRESS_FILE" ]]; then
  BASENAME=$(basename "$TASK_FILE" .md)
  PROGRESS_FILE="${BASENAME}-progress.md"
fi

# Create state file
mkdir -p .claude

cat > .claude/task-loop.local.md <<EOF
---
active: true
iteration: 1
max_iterations: $MAX_ITERATIONS
task_file: "$TASK_FILE"
progress_file: "$PROGRESS_FILE"
started_at: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
status: running
---

# Task Loop State

Active task execution loop. Read progress from: $PROGRESS_FILE
EOF

# Create/update current-task.md for session context
cat > .claude/current-task.md <<EOF
---
task_file: "$TASK_FILE"
progress_file: "$PROGRESS_FILE"
last_updated: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
---

# Current Task Reference

Task: $TASK_FILE
Progress: $PROGRESS_FILE

Per riprendere: /task-loop:loop "$TASK_FILE" --progress "$PROGRESS_FILE"
EOF
echo "Created current task reference: .claude/current-task.md"

# Initialize progress file if it doesn't exist
if [[ ! -f "$PROGRESS_FILE" ]]; then
  TASK_CONTENT=$(cat "$TASK_FILE")
  cat > "$PROGRESS_FILE" <<EOF
---
task: $TASK_FILE
started: $(date -u +%Y-%m-%dT%H:%M:%SZ)
status: in_progress
current_step: 1
total_steps: 0
last_updated: $(date -u +%Y-%m-%dT%H:%M:%SZ)
---

# Task Progress

## Original Task
$TASK_CONTENT

## Steps
<!-- Steps will be added as the task is analyzed -->

## Activity Log
- $(date -u +%Y-%m-%dT%H:%M:%SZ): Task loop initialized
EOF
  echo "Created progress file: $PROGRESS_FILE"
fi

# Output setup message
cat <<EOF

Task Loop Activated

Task File: $TASK_FILE
Progress File: $PROGRESS_FILE
Max Iterations: $(if [[ $MAX_ITERATIONS -gt 0 ]]; then echo $MAX_ITERATIONS; else echo "unlimited"; fi)

The loop will:
1. Read and analyze the task
2. Break it into atomic steps
3. Execute each step with appropriate agent
4. Run code review after each implementation
5. Track progress for resumption

To monitor: cat $PROGRESS_FILE

Loop runs until all tasks complete or max-iterations reached.

Starting execution...
EOF

echo ""
echo "Read @$TASK_FILE and @$PROGRESS_FILE, then begin execution following the task-loop workflow."
