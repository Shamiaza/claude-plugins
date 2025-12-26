---
description: Log a session note to project memory
---

# Log Session Note

Log a note to project memory.

## Usage
`/project-memory:log [category] [description]`

Categories: `decision`, `bug`, `feature`, `discovery`, `refactor`

## Input Processing

Parse $ARGUMENTS:
- If first word is a category, use it
- If no category, infer from content
- Rest is the description/content

Examples:
- `/project-memory:log decision We chose Redux over Context for global state`
- `/project-memory:log bug Fixed race condition in auth flow`
- `/project-memory:log Added new payment integration` (auto-categorize as feature)

## Execution

Use @session-logger agent with:
1. The category (explicit or inferred)
2. The description/content
3. Current date
4. Request to:
   - Create session note file
   - Use proper template
   - Add relevant tags
   - Link to any mentioned files

## Quick Log Mode

If description is short (<50 chars):
- Create minimal note
- Auto-tag based on keywords
- Skip detailed template

## Full Log Mode

If description is longer or complex:
- Use full template
- Ask for additional details:
  - Files involved?
  - Decisions made?
  - Follow-up items?
- Generate comprehensive note

## Output

Confirm:
- File created at: [path]
- Category: [category]
- Tags: [tags]
- Preview of note

## Examples

```
> /project-memory:log decision Using TypeScript strict mode

Created: .claude/memory/sessions/2024-01-15-typescript-strict.md
Category: decision
Tags: #typescript #configuration
```

```
> /project-memory:log bug Fixed null pointer in UserService.getProfile

Created: .claude/memory/sessions/2024-01-15-userservice-bug.md
Category: bug
Tags: #bug #UserService
```
