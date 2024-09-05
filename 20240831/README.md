### 0/1 Knapsack Problem Definition

**Given:**
- **Items:** A set of `N` items, each with:
  - A weight `weights[i]`
  - A value `values[i]`
- **Knapsack Capacity:** A maximum weight `W` that the knapsack can carry.

**Objective:**
- Determine the maximum total value that can be obtained by selecting a subset of the `N` items such that their combined weight does not exceed the knapsack's capacity `W`.

**Constraints:**
- You can either include an item in its entirety or exclude it; fractional inclusion is not allowed.
- The total weight of the selected items must be less than or equal to the knapsack capacity `W`.
