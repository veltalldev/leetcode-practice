### Problem Definition

Given a binary search tree (BST) and a range \[a, b\] (inclusive), return the sum of the elements in the tree that fall within this range. The tree structure ensures that for each node, the left subtree contains values less than the node’s value, and the right subtree contains values greater than the node’s value.

#### Example:

Tree:

        5
       / \
      3   8
     / \ / \
    2  4 6  10

Range: \[4, 9\]

Expected Output: 23 (sum of 4, 5, 6, 8)

### Function Signature
You need to implement a function with the following signature:

```dart
int rangeSumBST(TreeNode? root, int a, int b);
