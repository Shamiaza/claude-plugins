# Project Memory Plugin

Complete project memory management for Claude Code. Organize, track, and maintain project knowledge effectively.

## Features

- **Modular Organization**: Split large CLAUDE.md files into thematic rule files
- **Session Logging**: Capture decisions, bugs, discoveries during development
- **Architecture Sync**: Keep documentation in sync with code changes
- **Periodic Review**: Audit and clean stale or inaccurate documentation

## Installation

```bash
claude plugins:add github:Shamiaza/claude-plugins
```

## Commands

### `/project-memory:init`
Initialize the standard memory structure in a new project.

```bash
/project-memory:init
```

Creates:
```
.claude/
├── rules/
│   ├── architecture.md
│   ├── conventions.md
│   ├── dependencies.md
│   └── workflows.md
└── memory/
    └── sessions/
```

### `/project-memory:organize`
Reorganize existing memory files into modular structure.

```bash
/project-memory:organize
```

### `/project-memory:sync`
Synchronize memory with current codebase state after changes.

```bash
/project-memory:sync
/project-memory:sync src/components  # Focus on specific area
```

### `/project-memory:review`
Perform periodic review and cleanup of memory files.

```bash
/project-memory:review
/project-memory:review --deep  # Comprehensive review
```

### `/project-memory:log [category] [description]`
Log a session note.

```bash
/project-memory:log decision Using Redux for state management
/project-memory:log bug Fixed auth race condition
/project-memory:log feature Added payment integration
/project-memory:log discovery Found undocumented API behavior
/project-memory:log refactor Simplified error handling
```

## Agents

| Agent | Purpose |
|-------|---------|
| `memory-organizer` | Structure memory into modular files |
| `architecture-watcher` | Detect and sync architectural changes |
| `session-logger` | Create session notes and logs |
| `memory-reviewer` | Audit and maintain memory health |

## Memory Structure

### `.claude/rules/`
Thematic rule files for different aspects:
- `architecture.md` - Design patterns, structure, data flow
- `conventions.md` - Naming, style, testing conventions
- `dependencies.md` - External packages and integrations
- `workflows.md` - Build, deploy, review processes

### `.claude/memory/sessions/`
Session notes organized by date:
- `2024-01-15-auth-refactor.md`
- `2024-01-16-bug-fix.md`

## Hook

The plugin includes a non-blocking reminder hook that displays after Edit/Write operations:

```
💡 Memory tip: If you changed architecture/patterns, consider /project-memory:sync
```

## Best Practices

1. **Initialize early**: Run `/project-memory:init` when starting a new project
2. **Log as you go**: Use `/project-memory:log` during significant sessions
3. **Sync after changes**: Run `/project-memory:sync` after architectural changes
4. **Review regularly**: Schedule `/project-memory:review` monthly

## License

MIT
