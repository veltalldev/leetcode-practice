import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('sumInRangeBST', () {
    test('should return 23 for range [4, 9] on example tree', () {
      // Build the tree
      var root = TreeNode(5);
      root.left = TreeNode(3);
      root.right = TreeNode(8);
      root.left!.left = TreeNode(2);
      root.left!.right = TreeNode(4);
      root.right!.left = TreeNode(6);
      root.right!.right = TreeNode(10);

      expect(sumInRangeBST(root, 4, 9), equals(23));
    });

    test('should return 0 for range [11, 20] with no nodes in range', () {
      var root = TreeNode(5);
      root.left = TreeNode(3);
      root.right = TreeNode(8);
      root.left!.left = TreeNode(2);
      root.left!.right = TreeNode(4);
      root.right!.left = TreeNode(6);
      root.right!.right = TreeNode(10);

      expect(sumInRangeBST(root, 11, 20), equals(0));
    });

    test('should return 18 for range [2, 4] on example tree', () {
      var root = TreeNode(5);
      root.left = TreeNode(3);
      root.right = TreeNode(8);
      root.left!.left = TreeNode(2);
      root.left!.right = TreeNode(4);
      root.right!.left = TreeNode(6);
      root.right!.right = TreeNode(10);

      expect(sumInRangeBST(root, 2, 4), equals(9));
    });

    test(
        'should return the value of the root when the tree only contains one node',
        () {
      var root = TreeNode(10);

      expect(sumInRangeBST(root, 5, 15), equals(10));
    });

    test('should return 0 when the tree is empty', () {
      expect(sumInRangeBST(null, 4, 9), equals(0));
    });
  });
}
