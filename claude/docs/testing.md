# Testing

## Unit Tests

- Mock direct dependencies only.
- Test the unit in isolation from its immediate collaborators.

## Integration Tests

- Mock as deep as possible.
- Mock external APIs and third-party services.
- Do not mock database records or internal classes.
- Test real interactions between internal components.
