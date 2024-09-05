# Problem: Collatz Sequence and Longest Sequence for n ≤ 1,000,000

## Problem Statement:
A **Collatz sequence** in mathematics can be defined as follows. Starting with any positive integer `n`:
- If `n` is even, the next number in the sequence is `n / 2`.
- If `n` is odd, the next number in the sequence is `3n + 1`.

It is conjectured that every such sequence eventually reaches the number `1`. Write a function to test this conjecture by generating the sequence for any positive integer `n`.

### Bonus:
Find the value of `n` (where `n ≤ 1,000,000`) that gives the **longest Collatz sequence**.

### Example:
**Input**:
```plaintext
n = 13
```
**Output**:
```plaintext
[13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
```