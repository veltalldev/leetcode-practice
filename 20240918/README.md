# Find Cousins of a Given Node in a Binary Tree

## Problem Definition

### Objective
Given the root of a binary tree and a target node, find and return all **cousins** of that node. Two nodes are considered cousins if they are on the same level of the tree but have **different parents**.

### Example

Consider the following binary tree:

```plaintext
    1
   / \
  2   3
 / \   \
4   5   6
```

- For the target node `4`, its cousin is **6**, since they are both at the same level and have different parents (`2` and `3` respectively).
- Nodes `5` and `6` are **not cousins** because they share the same parent (`3`).

### Input
- A binary tree root node.
- A target node for which you need to find cousins.

### Output
- A list of cousin nodes for the given target node. If the target node has no cousins, return an empty list.

### Notes
- Nodes that are at the same level in the tree but have the same parent are **not cousins**.
- The tree is assumed to have unique values for each node.
- If the target node is at the root or has no cousins, return an empty list.
