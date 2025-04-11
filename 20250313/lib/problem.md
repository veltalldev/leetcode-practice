# Alternating Add/Subtract Curried Function

## Problem Definition
Create a curried function `add_subtract` that performs additions and subtractions in alternation. The function should:

1. Accept a starting value as its first argument
2. Return a function that accepts the next value
3. Perform addition on the first call, subtraction on the second, addition on the third, and so on
4. Each returned function should maintain the current result and knowledge of which operation comes next
5. The process should be able to continue indefinitely

## Examples

```
// Starting with 5
const calc = add_subtract(5);

// First operation is addition: 5 + 3 = 8
calc(3) === 8;

// Second operation is subtraction: 8 - 2 = 6
calc(2) === 6;

// Third operation is addition: 6 + 7 = 13
calc(7) === 13;

// Fourth operation is subtraction: 13 - 4 = 9
calc(4) === 9;
```

Another way to express the same example:
```
add_subtract(5)(3)(2)(7)(4) === 9
```

Additional examples:

```
// Starting with 0
const calc2 = add_subtract(0);
calc2(10) === 10;   // Addition: 0 + 10
calc2(5) === 5;     // Subtraction: 10 - 5
calc2(3) === 8;     // Addition: 5 + 3
calc2(2) === 6;     // Subtraction: 8 - 2

// Starting with negative number
add_subtract(-10)(5)(7)(2) === -10;  // -10 + 5 - 7 + 2 = -10

// Chaining all at once
add_subtract(1)(2)(3)(4)(5) === -1;  // 1 + 2 - 3 + 4 - 5 = -1
```

## Variations to Consider
- What should happen with non-numeric inputs?
- Should there be a way to reset the calculation?
- How should we handle edge cases like Infinity or NaN?