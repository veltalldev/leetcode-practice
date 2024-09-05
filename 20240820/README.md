# Problem: Implement `rand5()` Using `rand7()`

## Problem Statement:
You are given a function `rand7()` that generates a random integer between 1 and 7 (inclusive) with uniform probability. Using this function, implement a new function `rand5()` that generates a random integer between 1 and 5 (inclusive) with uniform probability.

### Example:
**Input**:
```plaintext
No input (calling rand5())
```
**Output**:
```plaintext
An integer between 1 and 5 (inclusive), uniformly distributed.
```

### Constraints:

The output of rand5() should have a uniform distribution, meaning each integer from 1 to 5 must have an equal probability of being chosen.
You cannot directly use any other random number generator aside from rand7().