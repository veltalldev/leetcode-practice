### Problem: Find a Triplet that Sums to K

The problem requires determining whether there are three numbers in a list that sum to a given target value `K`. This is an extension of the well-known "two-sum problem" and involves identifying if such a triplet exists in the list.

### Approach:

This solution leverages a helper function designed for the two-sum problem and builds upon it to handle three numbers (triplets). Here's how the solution works:

1. **Two-Sum Helper Function**:
   The `hasPairWithSum` function checks whether two numbers in a given list sum to a specific value `k`. It does this by iterating over every possible pair in the list and checking if their sum equals `k`. If such a pair is found, the function returns `true`; otherwise, it returns `false`.

2. **Extending to Three Numbers**:
   The main function, `hasTripletWithSum`, extends the two-sum logic to handle three numbers. Here's the approach:
   - The algorithm iterates over each element `i` in the list.
   - For each element `i`, it removes that element from the list and then checks whether there exists a **pair** of numbers in the remaining list that sums to `K - list[i]`. This reduces the problem to the two-sum problem for each element.
   - If a valid pair is found for any `i`, the function returns `true`, meaning that a triplet summing to `K` exists. If no such triplet is found after iterating through the list, the function returns `false`.

3. **Efficiency**:
   This approach uses two nested loops:
   - The outer loop iterates through each element to remove one number from consideration.
   - The inner helper function then checks for a two-sum solution in the remaining numbers.

   The time complexity is O(n²), where `n` is the length of the list. This is because for each element `i`, the function checks pairs from the remaining elements, leading to a quadratic time complexity.

### Conclusion:

This solution efficiently checks for the existence of a triplet that sums to `K` by breaking the problem down into multiple two-sum checks. It leverages the two-sum problem to handle the triplet search in a straightforward and understandable way.
