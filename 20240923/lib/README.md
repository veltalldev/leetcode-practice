### Problem: Partition a Linked List Around a Pivot

This problem requires partitioning a linked list around a given pivot value `k`. The goal is to rearrange the list such that all nodes with values less than `k` appear before nodes with values greater than or equal to `k`.

### Approach:

The solution leverages two pointers to build two separate linked lists—one for values smaller than the pivot and one for values greater than or equal to the pivot. After building the two lists, they are stitched together to form the final partitioned list.

Here's the breakdown:

1. **Linked List Structure**:
   The solution uses a simple implementation of a linked list with nodes containing a `value` and a `next` pointer. Each node represents an element of the list, and the nodes are linked together via the `next` pointer.

2. **Two Separate Lists**:
   The main function `partitionLinkedListAroundPivot` processes each node in the original list and appends it to one of two new lists:
   - **Small List** (`rootSmall`): Contains nodes with values less than `k`.
   - **Big List** (`rootBig`): Contains nodes with values greater than or equal to `k`.

   As we iterate through the original list, the value of each node is checked. If the value is less than `k`, it is appended to the `rootSmall` list; otherwise, it is added to the `rootBig` list.

3. **Appending Nodes**:
   The `append` helper function is used to add new nodes to the respective linked lists. It handles inserting new nodes at the beginning of the list and linking them correctly.

4. **Stitching the Lists Together**:
   After traversing the original list, the two separate lists (small and big) are stitched together:
   - If the small list is empty, the function returns the big list directly.
   - Otherwise, the small list's last node is linked to the first node of the big list, and the combined list is returned.

### Conclusion:

This solution efficiently partitions the linked list by creating two separate linked lists—one for values smaller than the pivot and one for values greater than or equal to the pivot. By keeping the two lists independent during traversal and then stitching them together, the algorithm ensures that the partitioning is done in **O(n)** time, where `n` is the number of nodes in the list.
