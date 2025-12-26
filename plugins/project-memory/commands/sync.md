---
description: Synchronize project memory after architectural changes
---
ultrathink

# Sync Project Memory

Synchronize project memory with current codebase state.

## Input
If arguments provided: Focus sync on specific area ($ARGUMENTS)
If no arguments: Full project sync

## Phase 1: Analyze Changes

1. Run `git diff` to see recent changes (if git available)
2. Run `git log --oneline -10` to see recent commits
3. Identify files that typically indicate architectural changes:
   - package.json / requirements.txt / pubspec.yaml
   - Config files (tsconfig, webpack, etc.)
   - New directories or major file reorganization
   - New abstractions (interfaces, base classes)

## Phase 2: Read Current Memory

1. Read all files in `.claude/rules/`
2. Read root CLAUDE.md
3. Read subdirectory CLAUDE.md files
4. Note what each file currently documents

## Phase 3: Detect Discrepancies

Use @architecture-watcher agent to:
1. Compare documented architecture vs actual
2. Compare documented dependencies vs actual
3. Compare documented conventions vs actual code patterns
4. Identify new patterns not yet documented
5. Identify documented items that no longer exist

## Phase 4: Generate Sync Report

Present findings:
```
## Sync Report

### New Items to Document
- [item]: [where it should go]

### Outdated Documentation
- [file]: [section] - [what's wrong]

### Suggested Updates
1. [update 1]
2. [update 2]
```

## Phase 5: Apply Updates

For each update:
1. Show the proposed change
2. Ask for confirmation (unless minor fix)
3. Apply the change
4. Log the update

## Phase 6: Session Log

Use @session-logger to create a session note documenting:
- What was synced
- Changes made
- Any manual follow-ups needed

## Important Rules

- Never delete information without explicit confirmation
- Show diffs for significant changes
- Prefer adding to existing files over creating new ones
- Maintain consistent formatting with existing content
