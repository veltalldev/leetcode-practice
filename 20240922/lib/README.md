### Problem: Reverse a Linked List

The problem is to reverse a given linked list. The task can be performed using either an **iterative approach** or by using a **stack**.

### Approach 1: Iterative Reversal

1. **Iterative Process**:
   The `reverseLinkedListIterative` function reverses the linked list by manually adjusting the links between the nodes. It maintains three pointers:
   - `prev`: Tracks the node that has just been processed (initially the root).
   - `current`: Tracks the node currently being processed.
   - `next`: Tracks the node that will be processed next.

   The process involves iterating through the list, setting each node’s `next` pointer to point to the previous node (reversing the link), and updating the pointers to move forward. This continues until all nodes have been reversed, and the function finally returns the new root.

2. **Handling Edge Cases**:
   The solution includes specific checks to handle cases where the linked list contains only one or two nodes. For a list of two nodes, the reversal is done manually without entering the loop.

### Approach 2: Reversal Using a Stack

1. **Stack-Based Reversal**:
   The `reverseLinkedListStack` function uses a **stack** to reverse the linked list. The stack temporarily holds all the nodes in the list, allowing for easy reversal. Here's how it works:
   - Traverse through the list and push each node onto the stack.
   - After reaching the last node, pop nodes from the stack one by one. For each popped node, adjust its `next` pointer to point to the previously popped node (effectively reversing the list).

2. **Final Adjustments**:
   Once all the nodes have been popped from the stack and relinked, the function returns the last node as the new root, and it trims the `next` pointer of the last node to ensure there are no lingering links from the original list.

### Conclusion:

The solution provides two different methods for reversing a linked list:
- **Iterative Reversal**: An in-place reversal that adjusts pointers one by one.
- **Stack-Based Reversal**: Uses additional space (the stack) to simplify traversal and reversal.

Both methods run in **O(n)** time, where `n` is the number of nodes in the list, but the stack-based approach uses **O(n)** additional space for the stack, whereas the iterative method works in constant space **O(1)**.
