/// 20241015
///
/// This problem seems like a straightforward traverse-and-sum problem, but
/// there is a small opportunity for optimization by leveraging the
/// BST property of the tree. Instead of an exhaustive iterative approach
/// we can performa recursive traversal

class TreeNode {
  final int data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data, [TreeNode? left = null, TreeNode? right = null]) {
    this.left = left;
    this.right = right;
  }
}

int sumInRangeBST(TreeNode? root, int a, int b) {
  if (root == null || a > b) return 0;
  var leftSum = 0;
  var rightSum = 0;
  if (root.data >= a) {
    leftSum = sumInRangeBST(root.left, a, b);
  }
  if (root.data <= b) {
    rightSum = sumInRangeBST(root.right, a, b);
  }
  if (a <= root.data && root.data <= b) {
    return (leftSum + rightSum + root.data);
  }
  return (leftSum + rightSum);
}
