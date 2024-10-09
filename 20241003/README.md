# Problem: Smallest Window to Sort

## Description

You are given an array of integers that is out of order. Your task is to determine the bounds of the **smallest window** (subarray) that must be sorted in order for the entire array to become sorted.

### Example:

Consider the following input:

```
[3, 7, 5, 6, 9]
```

The array is not fully sorted. To sort the entire array, you need to sort a subarray (window) within it. The smallest such window, when sorted, will result in the entire array being sorted.

For the above example, the correct output would be:

`(1, 3)`


### Explanation:

- The subarray from index 1 to 3 is `[7, 5, 6]`.
- Sorting this subarray yields `[5, 6, 7]`.
- After sorting, the entire array becomes `[3, 5, 6, 7, 9]`, which is fully sorted.

### Input:

- An array of integers, where the array is out of order.

### Output:

- A tuple `(start, end)`, representing the 0-based indices of the smallest window that must be sorted in order for the array to become sorted.

---

### Constraints:

- The array will contain at least two integers.
- There is guaranteed to be at least one subarray that requires sorting.

