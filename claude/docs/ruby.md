# Ruby

- Prefer standardrb for linting, unless a repo is configured differently.
- Use mise to install Ruby.

# RSpec

## Naming Conventions

- Describe class methods with `.method_name`.
- Describe instance methods with `#method_name`.
- Start context descriptions with "when", "with", or "without".
- Use third-person present tense in descriptions, not "should".
  - Bad: `it 'should return the user'`
  - Good: `it 'returns the user'`
- Keep descriptions under 40 characters; use contexts to split longer ones.

## Structure

- Use `describe` blocks to group related tests by the method under test.
- Use `subject` to define the method being tested in a `describe` block.
- Use `context` blocks to describe different scenarios or setup conditions.
- Use `it` blocks to define individual test cases.
- Use `let` for lazily evaluated variables.
- Use `let!` for eagerly evaluated variables.
- Use `before` and `after` hooks for setup and teardown.
- Prefer `let` over instance variables in `before` blocks.

## Test Design

- One expectation per test in isolated unit tests.
- Multiple expectations acceptable when setup is expensive.
- Test all cases: valid, edge, and invalid—not just the happy path.
- Create only the data needed for the test.
- Use factories (FactoryBot), not fixtures.
- Extract duplicated test logic into shared examples with `it_behaves_like`.

## Assertions and Mocking

- Use `expect` syntax, never `should`.
- Use `is_expected.to` for one-liner specs.
- Use `allow` and `expect` for mocking and stubbing.
- Prefer `expect(mock).to have_received(:method)` (spy) over `expect(mock).to receive(:method)` (setup).
- Never use `double`; use `instance_double` or `class_double` instead.
- Stub external HTTP requests with WebMock or VCR.

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

## Running Tests

- Always use `bundle exec rspec` to ensure correct environment and dependencies.
- Run specific files with `bundle exec rspec path/to/test_file.rb`.
