---
description: Initialize project memory structure with standard directories and template files
---
ultrathink

# Initialize Project Memory

You are initializing the project memory structure. Follow these steps:

## Phase 1: Check Existing State

1. Check if `.claude/` directory exists
2. Check for existing CLAUDE.md files
3. List any existing memory/rule files

## Phase 2: Create Directory Structure

Create the following structure:
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

## Phase 3: Create Template Files

### architecture.md
```markdown
# Architecture

## Overview
[Describe the high-level architecture of this project]

## Design Patterns
[List and explain design patterns used]

## Module Structure
[Explain how code is organized]

## Data Flow
[Describe how data moves through the system]

## State Management
[Explain state management approach]
```

### conventions.md
```markdown
# Conventions

## Naming Conventions
- Files: [convention]
- Functions: [convention]
- Variables: [convention]
- Components: [convention]

## Code Style
[Describe code style preferences]

## Documentation
[Describe documentation standards]

## Testing
[Describe testing conventions]
```

### dependencies.md
```markdown
# Dependencies

## Core Dependencies
| Package | Purpose | Version |
|---------|---------|---------|

## Dev Dependencies
| Package | Purpose | Version |
|---------|---------|---------|

## Integration Notes
[Notes about external integrations]
```

### workflows.md
```markdown
# Workflows

## Development Setup
[Steps to set up development environment]

## Build Process
[How to build the project]

## Testing
[How to run tests]

## Deployment
[Deployment procedures]

## Code Review
[Code review process]
```

## Phase 4: Update Root CLAUDE.md

If root CLAUDE.md exists:
- Keep critical information
- Add references to new rule files
- Simplify to overview

If no root CLAUDE.md:
- Create minimal overview pointing to rules

## Phase 5: Report

Output:
- Directories created
- Files created
- Any existing content preserved
- Next steps recommendations

## Important

- DO NOT overwrite existing content without user confirmation
- If files exist, show diff and ask before replacing
- Preserve any custom content in existing files
