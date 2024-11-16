# UTF-8 Validator
## Problem Statement
Implement a function that validates whether a given sequence of bytes represents a valid UTF-8 encoding.

## Background
UTF-8 is a variable-width character encoding that uses one to four bytes to represent Unicode characters. Each multi-byte character follows a specific pattern where:
- The first byte indicates the total number of bytes for the character
- Any subsequent bytes follow a continuation pattern

## Input
- An array of integers where each integer represents a byte value (0-255)
- Example: `[230, 130, 172]` represents the Euro sign (€)

## Output
- Boolean value
  - `true` if the byte sequence is a valid UTF-8 encoding
  - `false` if the byte sequence is invalid

## Encoding Rules
### Byte Patterns

```
 Bytes   |           Byte format
-----------------------------------------------
   1     | 0xxxxxxx                            # Single byte - ASCII
   2     | 110xxxxx 10xxxxxx                   # Two bytes
   3     | 1110xxxx 10xxxxxx 10xxxxxx          # Three bytes
   4     | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx # Four bytes
```

### Validation Rules
1. **First Byte Pattern**
   - For single-byte character: first bit must be 0
   - For n-byte character: first byte starts with n ones followed by a zero

2. **Continuation Byte Pattern**
   - All continuation bytes must start with '10'
   - Number of continuation bytes must match the pattern indicated by the first byte

3. **General Rules**
   - Each byte value must be between 0 and 255
   - The sequence must contain complete characters (no partial characters)
   - Maximum of 4 bytes per character

## Example Cases
1. Valid single byte:
   ```
   Input: [65]  # ASCII 'A'
   Output: true
   ```

2. Valid multi-byte (Euro sign):
   ```
   Input: [230, 130, 172]  # '€'
   Output: true
   ```

3. Invalid sequence:
   ```
   Input: [230, 256, 172]  # Invalid byte value
   Output: false
   ```

## Edge Cases to Consider
1. Empty input array
2. Incomplete sequences
3. Invalid byte values (> 255)
4. Invalid continuation bytes

## Constraints
- Input array length: 1 ≤ n ≤ 4 (only validate one character at a time)
- Byte values: 0 ≤ value ≤ 255

## Performance Requirements
- Time Complexity: O(n) where n is the length of the input array
- Space Complexity: O(1)