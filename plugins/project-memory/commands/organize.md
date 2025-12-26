---
description: Reorganize existing project memory into modular structure
---
ultrathink

# Organize Project Memory

Reorganize existing project memory into a clean, modular structure.

## Input
If arguments provided: Organize specific file ($ARGUMENTS)
If no arguments: Organize entire project memory

## Phase 1: Inventory

1. Find all memory-related files:
   - `**/CLAUDE.md`
   - `**/CLAUDE.local.md`
   - `.claude/**/*.md`
   - Any `memory/` or `docs/` directories

2. Calculate total content size
3. Identify main topics covered

## Phase 2: Analysis

Use @memory-organizer agent to:
1. Read all memory files
2. Categorize each section by theme:
   - Architecture
   - Conventions
   - Dependencies
   - Workflows
   - Project-specific topics
3. Identify duplicates
4. Identify orphaned/unclear content

## Phase 3: Present Plan

Show reorganization plan:
```
## Reorganization Plan

### Current State
- [file count] files
- [line count] lines of documentation
- [duplicate count] duplicate sections

### Proposed Structure
.claude/
├── rules/
│   ├── architecture.md (from: [sources])
│   ├── conventions.md (from: [sources])
│   ├── dependencies.md (from: [sources])
│   ├── workflows.md (from: [sources])
│   └── [custom].md (from: [sources])
└── memory/
    └── sessions/

### Content Migration
| Source | Destination | Action |
|--------|-------------|--------|
| ... | ... | move/merge/delete |

### Duplicates to Resolve
- [content] in [file1] and [file2]
```

## Phase 4: Get Approval

Ask user to confirm:
- Overall structure
- Any content to be deleted
- Custom topic files needed

## Phase 5: Execute

1. Create target directory structure
2. Migrate content section by section
3. Remove duplicates (keep best version)
4. Update cross-references
5. Simplify root CLAUDE.md to overview

## Phase 6: Verify

1. Ensure no content was lost
2. Verify all links work
3. Check formatting consistency

## Phase 7: Report

Output:
- Files created
- Files modified
- Files that can be deleted
- Any manual cleanup needed

## Safety Rules

- ALWAYS backup/preserve original before modifying
- Show content being deleted and get confirmation
- Preserve CLAUDE.local.md content separately
- Don't reorganize files outside .claude/ without explicit permission
