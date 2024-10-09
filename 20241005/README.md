# Problem: Most Frequent Subtree Sum

## Description

Given the root of a binary tree, your task is to find the most frequent subtree sum. The **subtree sum** of a node is the sum of all values under that node, including the node itself.

### Example:

Consider the following binary tree:
```
  5
 / \
2  -5
```


The subtree sums are as follows:

- The subtree sum of the left leaf (`2`) is `2`.
- The subtree sum of the right leaf (`-5`) is `-5`.
- The subtree sum of the root (`5`) is the sum of the root value (`5`) and the subtree sums of its left and right children, which is `2 + (-5) + 5 = 2`.

In this case, the most frequent subtree sum is `2`, as it occurs twice: once as the left leaf, and once as the sum of the root subtree (2 + 5 - 5).

### Input:

- The root of a binary tree, where each node contains an integer value.

### Output:

- The most frequent subtree sum, which may appear multiple times.

---

## Constraints:

- The binary tree will have at least one node.
- Multiple subtree sums can have the same frequency; in such cases, return any of them.
