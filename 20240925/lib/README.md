### Problem: Minimum Brick Cuts in a Wall

The problem asks for the minimum number of bricks that must be cut when drawing a vertical line through a wall made up of rows of bricks. Each row is represented as a list of integers, where each integer corresponds to the length of a brick in that row.

### Approach:

There are two possible approaches to solving this problem. The implemented solution uses a frequency-based approach to find the optimal position for a vertical cut, minimizing the number of bricks it passes through.

1. **Understanding the Problem**:
   - The goal is to draw a vertical line that goes through the **fewest number of bricks**.
   - The line can only be drawn between the edges of bricks, not through them, so the challenge is to find where the most edges align across different rows of the wall.

2. **Prefix Sum and Cut Frequency**:
   To determine the best place to draw the line, the solution tracks the **prefix sums** of each row (i.e., cumulative brick lengths). Each prefix sum represents a position where a vertical cut could occur.

   - **Prefix Sum Calculation**: For each row, we calculate the running total (prefix sum) of brick lengths as we move from left to right. The prefix sum marks potential cut positions where the end of one brick and the beginning of another align.
   - **Frequency Map**: As we compute the prefix sums, we store their frequencies in a map (`prefixSumFreq`). The key in the map is the prefix sum (cut position), and the value is the number of rows that align at that position.

3. **Optimal Cut**:
   Once the frequency map is populated, we find the cut position that has the highest frequency. This cut position represents the vertical line that passes through the **most edges** of bricks, which implies that it cuts through the fewest bricks.

4. **Counting Bricks Cut**:
   After identifying the optimal cut position, the solution iterates through each row to count how many rows do **not** have an edge aligned at that position (i.e., how many bricks the cut will pass through).

### Key Points:
- The last prefix sum is excluded because it represents the right edge of the wall, and cutting through the right edge doesn't count.
- The cut position that aligns with the most brick edges minimizes the number of bricks that are cut.

### Time Complexity:
The solution processes each row of bricks twice—once to calculate prefix sums and once to count the number of bricks that the cut passes through. This results in a time complexity of **O(n)**, where `n` is the total number of bricks across all rows.

### Conclusion:
By leveraging a prefix sum approach and tracking the frequency of potential cut positions, this solution efficiently finds the vertical cut that minimizes the number of bricks cut. The cut position that passes through the most brick edges is the optimal one.
