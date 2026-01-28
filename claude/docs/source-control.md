# Source Control

## Branching

Branch names should be prefixed with the Jira ticket ID when applicable.
- `ABC-123`
- `ABC-123-fix-xyz`

## Commit Messages

- Concise and descriptive.
- Imperative mood, present tense.
- Follow Semantic Commit Messages format.

```
[ABC-123] feat: add hat wobble
^--^  ^------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```

## Semantic Commit Types

| Type | Purpose |
|------|---------|
| `feat` | New feature for the user |
| `fix` | Bug fix for the user |
| `docs` | Documentation changes |
| `style` | Formatting, no code change |
| `refactor` | Refactoring production code |
| `test` | Adding or refactoring tests |
| `chore` | Build tasks, no production code change |
