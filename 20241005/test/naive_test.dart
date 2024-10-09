import 'package:test/test.dart';
import 'package:leetcode20241005/naive.dart';

void main() {
  test('Test with example tree', () {
    TreeNode<int> root = TreeNode(5, left: TreeNode(2), right: TreeNode(-5));
    expect(subtreeSums(root), equals(2));
  });

  test('Test with single node tree', () {
    TreeNode<int> root = TreeNode(1);
    expect(subtreeSums(root), equals(1));
  });

  test('Test with empty tree', () {
    expect(subtreeSums(null), equals(0));
  });

  test('Test with multiple frequent subtree sums', () {
    TreeNode<int> root = TreeNode(5,
        left: TreeNode(2, left: TreeNode(1), right: TreeNode(-1)),
        right: TreeNode(5));
    expect(subtreeSums(root),
        equals(5)); // Multiple sums may appear with equal frequency
  });

  test('Test with negative values', () {
    TreeNode<int> root = TreeNode(-10, left: TreeNode(-5), right: TreeNode(-5));
    expect(subtreeSums(root), equals(-5));
  });
}
