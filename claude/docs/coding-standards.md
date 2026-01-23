# Coding Standards

## Philosophy

- Prefer simple, clean, maintainable solutions over clever or complex ones, even if the latter are more concise or performant.
- Readability and maintainability are primary concerns.
- Make the smallest reasonable changes to get to the desired outcome.
- Ask permission before reimplementing features or systems from scratch.

## Style

- Match the style and formatting of surrounding code, even if it differs from standard style guides.
- Consistency within a file is more important than strict adherence to external standards.

## Discipline

- Never make code changes that aren't directly related to the current task.
- If you notice something unrelated that should be fixed, document it separately.
- Never remove code comments unless they are actively false.
- Avoid referring to temporal context in comments (no "recently changed" or "new implementation").
- Never name things as "improved", "new", or "enhanced" - naming should be evergreen.

## Boundaries

- Never implement mock modes for testing - always use real data and APIs.
- Never rewrite implementations without explicit permission.
- Always ask for clarification rather than making assumptions.
