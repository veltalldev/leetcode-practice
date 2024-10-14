# Target Sum Problem

## Problem Definition:
You are given an integer array `nums` and an integer `target`. You want to assign a `+` or `-` sign to each element in the array such that the sum of the elements after assigning the signs equals the `target`. Return the number of different ways you can assign signs to make the sum equal to the target.

### Example 1:
**Input**:  
`nums = [1, 1, 1, 1, 1]`, `target = 3`  
**Output**: `5`  
**Explanation**: There are 5 ways to assign signs to the elements to reach the target 3:  

```
-1 + 1 + 1 + 1 + 1 = 3
+1 - 1 + 1 + 1 + 1 = 3
+1 + 1 - 1 + 1 + 1 = 3
+1 + 1 + 1 - 1 + 1 = 3
+1 + 1 + 1 + 1 - 1 = 3
```

### Example 2:
**Input**:  
`nums = [1]`, `target = 1`  
**Output**: `1`  

### Constraints:
- The length of the array is at most `20`.
- The elements of the array will be between `1` and `1000`.
- The sum of the array's elements will not exceed `1000`.
- The target value is an integer between `-1000` and `1000`.
