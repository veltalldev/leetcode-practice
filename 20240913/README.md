# Gray Code Generation

## Problem Definition

### Objective
Given an integer **n** representing the number of bits, generate a sequence of Gray code. A **Gray code** is a binary code where each successive value differs from the previous one by **exactly one bit**, including when wrapping around from the last value back to the first.

### Example

For **n = 2**, one possible Gray code sequence would be:

`[00, 01, 11, 10]`

In this sequence:
- `00` differs from `01` by one bit.
- `01` differs from `11` by one bit.
- `11` differs from `10` by one bit.
- `10` wraps around to differ from `00` by one bit.

### Notes
- The input is an integer **n** where `n >= 1`.
- The output should be a list of **Gray code values** for **n** bits, represented as binary strings.
- Multiple valid Gray code sequences may exist, as long as each successive code in the sequence differs by exactly one bit.
- The solution must generate a valid Gray code sequence for the given number of bits.
