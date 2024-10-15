import 'dart:math';

/// 20241014
///
/// Simple recursion problem

class TreeNode<T> {
  final T data;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.data, [left = null, right = null]) {
    this.left = left;
    this.right = right;
  }
}

// the balance condition is an intersection of:
//  - the left subtree being balanced
//  - the right subtree being balanced
//  - their heights are compliant
bool isHeightBalanced(TreeNode? root) {
  final result = _isHeightBalanced(root);
  return result.$1;
}

// helper function
(bool, int) _isHeightBalanced(TreeNode? root) {
  if (root == null) return (true, 0);
  final (balancedLeft, heightLeft) = _isHeightBalanced(root.left);
  final (balancedRight, heightRight) = _isHeightBalanced(root.right);
  final isBalanced =
      balancedLeft && balancedRight && ((heightLeft - heightRight).abs() < 2);
  return (isBalanced, max(heightLeft, heightRight) + 1);
}
