# Count Nodes in a Complete Binary Tree

## Problem Definition

### Objective
Given a **complete binary tree**, count the total number of nodes in the tree in **faster than O(n)** time, where `n` is the total number of nodes.

A **complete binary tree** is a binary tree in which every level, except possibly the last, is completely filled, and all nodes in the last level are filled starting from the left.

### Example

Consider the following complete binary tree:

```plaintext
    1
   / \
  2   3
 / \  /
4   5 6
```


This tree has a total of **6 nodes**.

### Approach

- The time complexity should be better than O(n), ideally approaching **O(log² n)**.
- You may need to take advantage of the tree's completeness to minimize the number of nodes visited.

### Notes
- The tree is guaranteed to be a complete binary tree.
- The goal is to compute the total number of nodes without traversing every single node (which would take O(n) time).
