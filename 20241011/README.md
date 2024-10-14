# House Painting Problem

## Problem Definition:
There are `n` houses in a row, each house can be painted with one of `k` colors. The cost of painting each house with a certain color is represented by a 2D list `costs`, where `costs[i][j]` is the cost of painting house `i` with color `j`.

You need to paint all the houses such that no two adjacent houses have the same color, and the total cost of painting all houses is minimized. Return the minimum cost to paint all houses.

### Example 1:
**Input**:  

```dart
costs = [
  [17, 2, 17], [16, 16, 5], [14, 3, 19]
]
```  

**Output**: `10`  
**Explanation**:  
- Paint house 0 with color 1 (cost = 2)  
- Paint house 1 with color 2 (cost = 5)  
- Paint house 2 with color 1 (cost = 3)  
Total minimum cost = 2 + 5 + 3 = 10.

### Example 2:
**Input**:  
```dart
costs = [[7, 6, 2]]
```
**Output**: `2`  
**Explanation**: There's only one house, so paint it with the cheapest color.

### Constraints:
- `n == costs.length`
- `k == costs[i].length`
- `1 <= n <= 100`
- `2 <= k <= 20`
- `1 <= costs[i][j] <= 20`
