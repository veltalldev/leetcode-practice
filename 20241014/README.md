### Problem: Determine if a Binary Tree is Height-Balanced

Given a binary tree, determine whether or not it is height-balanced. A height-balanced binary tree is one in which the heights of the two subtrees of any node never differ by more than one.

### Example 1:
- **Input**: A balanced binary tree like this:

    ```
        1
       / \
      2   3
     / \
    4   5
    ```
- **Output**: `true`

### Example 2:
- **Input**: An unbalanced binary tree like this:

    ```
        1
       /
      2
     /
    3
    ```
- **Output**: `false`

### Function Signature
```dart
bool isHeightBalanced(TreeNode? root);
