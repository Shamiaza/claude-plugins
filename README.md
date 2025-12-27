# Claude Plugins by Shamiaza

A collection of Claude Code plugins for modern web and mobile development.

## Available Plugins

### react-dev
React development toolkit with specialized agents for:
- Component development with TypeScript and functional patterns
- Documentation generation
- Architectural decisions and code review

**Agents**: react-senior-dev, react-docs-writer, react-architect
**Commands**: /react-dev:execute-task, /react-dev:complete-workflow, /react-dev:generate-docs

### flutter-dev
Flutter development toolkit with Clean Architecture focus:
- Multi-tenant application development
- State management with Bloc/Provider/Riverpod
- Clean Architecture patterns (Domain, Data, Presentation)

**Agents**: flutter-senior-dev
**Commands**: /flutter-dev:execute-task, /flutter-dev:complete-workflow

### nestjs-dev
NestJS backend development toolkit:
- REST API development with proper DTOs and validation
- Clean architecture and SOLID principles
- Enterprise-grade patterns

**Agents**: nestjs-backend-architect
**Commands**: /nestjs-dev:execute-task, /nestjs-dev:complete-workflow

### context-management
Context and knowledge management toolkit:
- Deep codebase analysis and research
- Documentation writing and updates
- CLAUDE.md knowledge persistence
- Dependency mapping and flow analysis
- Architecture investigation and documentation

**Agents**: context-gatherer, doc-updater, memory-updater, flow-analyst, architecture-investigator
**Commands**: /context-management:gather

### orchestrator-mode
Enforces the orchestrator pattern for cleaner context management:
- Warns when main context attempts direct file edits
- Encourages delegation to specialized agents
- Keeps main context focused on orchestration

**Hooks**: PreToolUse (Edit, Write, MultiEdit)
**Commands**: None (passive hook only)

### project-memory
Comprehensive project memory management:
- Initialize memory structure with standard directories
- Log session notes and discoveries
- Sync memory after architectural changes
- Periodic review and maintenance

**Agents**: architecture-watcher, memory-organizer, memory-reviewer, session-logger
**Commands**: /project-memory:init, /project-memory:log, /project-memory:sync, /project-memory:organize, /project-memory:review

### rule-creator
Create and manage Claude rules files:
- Create new rule files in .claude/rules/
- Organize rules into subdirectories
- Set up path-specific rules with frontmatter

**Agents**: rule-creator
**Commands**: /rule-creator:create-rule

### task-loop
Long-running task execution with agent orchestration:
- Autonomous task execution across multiple sessions
- Spawns specialized agents per task step
- Progress tracking with checkpoint/resume support
- Code review after each implementation
- Session continuity via current-task.md

**Agents**: Uses existing framework agents (react, flutter, nestjs, angular)
**Commands**: /task-loop:loop, /task-loop:clear-task
**Hooks**: PostToolUse (session context, progress reminders)

## Installation

```bash
claude plugins:add github:Shamiaza/claude-plugins
```

## Usage

After installation, you can use the agents via the Task tool or the slash commands directly:

```
/react-dev:execute-task path/to/task.md
/flutter-dev:complete-workflow path/to/task.md
/nestjs-dev:execute-task path/to/task.md
```

## License

MIT
