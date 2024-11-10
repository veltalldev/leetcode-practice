# Pascal's Triangle Row Generator
## Problem Definition

Given a zero-based index `k`, implement a function that returns the `k`th row of Pascal's Triangle.

### Background
Pascal's Triangle is a triangular array of binomial coefficients where:
- Each number is the sum of the two numbers directly above it
- The first and last number in each row is 1
- Row indexing starts at 0

Example of Pascal's Triangle:
```
Row 0:      1
Row 1:     1 1
Row 2:    1 2 1
Row 3:   1 3 3 1
Row 4:  1 4 6 4 1
```

### Requirements

1. **Input**:
   - A single integer `k` (zero-based index)
   - `k` can be any non-negative integer
   - Must handle invalid inputs (negative numbers) with appropriate error handling

2. **Output**:
   - A list/array containing all numbers in the kth row of Pascal's Triangle
   - Numbers should be returned as integers

3. **Constraints**:
   - Must handle edge cases (k = 0, k = 1)
   - Solution should be efficient in terms of space complexity
   - All values must be computed accurately without overflow for reasonable inputs

### Examples

```dart
getPascalRow(0) → [1]
getPascalRow(1) → [1, 1]
getPascalRow(2) → [1, 2, 1]
getPascalRow(3) → [1, 3, 3, 1]
getPascalRow(4) → [1, 4, 6, 4, 1]
```

### Special Considerations

While this problem can be solved using the mathematical formula for binomial coefficients, the implementation should focus on:
1. Utilizing the symmetrical properties of Pascal's Triangle
2. Minimizing space complexity by reusing storage
3. Taking advantage of the fact that each row can be built using only information from the previous row

### Edge Cases to Handle

1. Negative input values (should throw ArgumentError)
2. Zero input (should return [1])
3. Input of 1 (should return [1, 1])

This problem tests understanding of:
- Dynamic Programming concepts
- Space optimization techniques
- Array manipulation
- Mathematical patterns
- Error handling
- Edge case management

### Solution Approaches

Two main approaches are possible:

1. **Mathematical Approach**:
   - Use binomial coefficient formula directly
   - Calculate each term using the relationship between consecutive terms
   - Time Complexity: O(k)
   - Space Complexity: O(k)

2. **Incremental Building Approach**:
   - Build each row incrementally using previous row's information
   - Utilize symmetry to optimize calculations
   - Time Complexity: O(k²)
   - Space Complexity: O(k)
   - Benefits from better readability and maintainability

The incremental building approach, while not as mathematically elegant, offers better code clarity and can be more intuitive to understand and maintain.