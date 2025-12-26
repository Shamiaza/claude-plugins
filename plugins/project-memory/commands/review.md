---
description: Perform periodic review and maintenance of project memory
---
ultrathink

# Review Project Memory

Perform comprehensive review of all project memory files.

## Input
If arguments provided: Focus review on specific area ($ARGUMENTS)
If no arguments: Full review

## Phase 1: Comprehensive Audit

Use @memory-reviewer agent to:
1. Read ALL memory files
2. Verify accuracy against actual code
3. Check for staleness
4. Identify duplicates
5. Find broken references
6. Generate health report

## Phase 2: Present Findings

Display the health report with:
- Overall health score (A-F)
- Critical issues (must fix)
- Warnings (should fix)
- Suggestions (nice to have)
- Stale content list
- Duplicate content list

## Phase 3: Interactive Cleanup

For each category, offer options:

### Critical Issues
```
Issue: [description]
File: [path]
Current: [current content]
Problem: [what's wrong]

Options:
1. Fix automatically
2. Show me the fix first
3. Skip for now
4. Mark as intentional
```

### Stale Content
```
File: [path]
Age: [how old]
Content preview: [preview]

Options:
1. Archive to old-sessions/
2. Delete
3. Keep (still relevant)
4. Merge into rules
```

### Duplicates
```
Content: [what's duplicated]
Found in:
  - [file1]: [context]
  - [file2]: [context]

Options:
1. Keep in [file1], remove from others
2. Keep in [file2], remove from others
3. Consolidate into new location
4. Keep all (intentional duplication)
```

## Phase 4: Apply Changes

1. Apply user-approved changes
2. Archive old content (don't delete immediately)
3. Update cross-references
4. Fix formatting issues

## Phase 5: Generate Report

Create session note via @session-logger:
```
# Memory Review Session
Date: [date]
Health Score: [before] → [after]

## Changes Made
- [change 1]
- [change 2]

## Skipped/Deferred
- [item 1]: [reason]

## Recommendations
- [recommendation 1]
- [recommendation 2]

## Next Review
Suggested: [date based on health score]
```

## Phase 6: Schedule Reminder

Based on health score:
- A: Review in 3 months
- B: Review in 2 months
- C: Review in 1 month
- D/F: Review in 2 weeks

## Review Modes

### Quick Review (default)
- Focus on critical issues
- Skip minor suggestions
- Faster completion

### Deep Review (--deep flag)
- Check every section
- Verify all code references
- Full duplicate analysis
- Comprehensive recommendations
