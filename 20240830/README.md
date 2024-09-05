# Problem: Minimum Cost to Build Houses with Different Colors

## Problem Statement:
A builder is looking to build a row of `N` houses that can be painted in `K` different colors. The goal is to **minimize the cost** of painting the houses while ensuring that **no two neighboring houses** are painted the same color.

You are given an `N x K` matrix, where the `n`th row and `k`th column represents the cost to build the `n`th house with the `k`th color. Your task is to return the **minimum cost** which satisfies the goal.

### Example:
**Input**:
```plaintext
costs = [
  [17, 2, 17],
  [16, 16, 5],
  [14, 3, 19]
]
```
**Output**:
```plaintext
10
```