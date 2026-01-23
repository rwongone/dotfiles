# Ruby

- Prefer standardrb for linting, unless a repo is configured differently.
- Use mise to install Ruby.

# RSpec

## Structure

- Use `describe` blocks to group related tests.
- Use `subject` to define the main object being tested.
- Use `context` blocks to describe different scenarios or conditions.
- Use `it` blocks to define individual test cases.
- Use `let` for lazily evaluated variables.
- Use `let!` for eagerly evaluated variables.
- Use `before` and `after` hooks for setup and teardown.

## Assertions and Mocking

- Use `expect` for assertions.
- Use `allow` and `expect` for mocking and stubbing.
- Never use `double`; use `instance_double` or `class_double` instead.

## Expectation Preferences

- Prefer `expect(...).to have_received(:...).with(...)` over blocks or captured variables.
- Use single comprehensive matchers rather than multiple separate `expect` statements.
- Use built-in RSpec matchers over custom matchers when possible.
- Avoid storing test data in variables for later assertion.
- Leverage existing object methods like `.attributes` or `.to_h` for simpler matching.
- For `have_attributes` tests, include explicit type checking first (e.g., `expect(subject).to be_an(Array)`).
- Use `an_instance_of(SpecificClass)` instead of generic `anything` when type is known.
- Use `have_attributes` with nested matchers for complex object validation.
- Keep tests simple and readable rather than complex or clever.
- Use conventional RSpec patterns rather than inventing new approaches.

## Running Tests

- Always use `bundle exec rspec` to ensure correct environment and dependencies.
- Run specific files with `bundle exec rspec path/to/test_file.rb`.
