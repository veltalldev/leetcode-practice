import 'package:test/test.dart';
import 'package:leetcode20241014/naive.dart';

void main() {
  group('Binary Tree Balance Tests', () {
    test('Should return true for a balanced binary tree', () {
      final root =
          TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3));
      expect(isHeightBalanced(root), equals(true));
    });

    test('Should return false for an unbalanced binary tree', () {
      final root = TreeNode(1, TreeNode(2, TreeNode(3)));
      expect(isHeightBalanced(root), equals(false));
    });

    test('Should return true for an empty tree', () {
      expect(isHeightBalanced(null), equals(true));
    });

    test('Should return true for a single-node tree', () {
      final root = TreeNode(1);
      expect(isHeightBalanced(root), equals(true));
    });

    test('Should return false for a highly unbalanced tree', () {
      final root = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4))));
      expect(isHeightBalanced(root), equals(false));
    });
  });
}
