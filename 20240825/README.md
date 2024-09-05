# Problem: Run-Length Encoding and Decoding

## Problem Statement:
**Run-length encoding** is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count followed by the character.

For example, the string `"AAAABBBCCDAA"` would be encoded as `"4A3B2C1D2A"`.

### Tasks:
1. Implement **run-length encoding**.
2. Implement **run-length decoding**.

### Assumptions:
- The input string to be encoded consists solely of alphabetic characters and contains no digits.
- The string to be decoded is valid (i.e., it follows the format of a valid run-length encoded string).

### Example 1:
**Input (Encoding)**:
```plaintext
"AAAABBBCCDAA"
```
**Output (Encoding)**:
```plaintext
"4A3B2C1D2A"
```

### Example 2:
**Input (Deccoding)**:
```plaintext
"4A3B2C1D2A"
```
**Output (Decoding)**:
```plaintext
"AAAABBBCCDAA"
```