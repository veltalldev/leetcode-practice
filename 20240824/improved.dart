import 'dart:math';

/// the idea for improvement comes from a particular technique
/// making use of the max heap to keep track of k smallest terms
/// The performance improvement comes from the fact that maintaining
/// a max-heap of size k over the course of n terms only takes klogk
/// runtime instead of the nlogn runtime of a regular sort approach

List<(int, int)> findNearestKPoints(
    List<(int, int)> points, (int, int) center, int k) {
  // build tree of size k
  TreeNode? root = buildMaxHeap(points, center, k);
  
  // iterate through the remaining points
  points.skip(k).map((point) {
    final newDistance = findCartesianDistance(point, center);
    final largest
  }) 
}

TreeNode? buildMaxHeap(List<(int, int)> points, (int, int) center, int k) {
  TreeNode? root;

  // add first k nodes at the front of the list
  points.take(k).map((point) {
    // double distance = findCartesianDistance(point, center);
    if (root == null) {
      root = TreeNode(point, null, null);
    } else {
      TreeNode temp = root!;
      root = TreeNode(point, temp, null);
      heapify(root!);
    }
  });
  return root;
}

double findCartesianDistance((int, int) A, (int, int) B) {
  var (xA, yA) = A;
  var (xB, yB) = B;
  return sqrt(pow(xB - xA, 2) + pow(yB - yA, 2));
}

void heapify(TreeNode root, (int, int) center) {
  // placeholders
  final tempValue = findCartesianDistance(root.value, center);
  final left = root.left;
  final right = root.right;
  TreeNode swapNode;

  // determine nodes to heapify
  if (root.isLeaf) return;
  if (left != null && right == null) {
    swapNode = left;
  } else if (left == null && right != null) {
    swapNode = right;
  } else
    swapNode = (left!.value > right!.value) ? left : right;

  // swap
  root.value = swapNode.value;
  swapNode.value = tempValue;
}

class TreeNode<T> {
  TreeNode? left;
  TreeNode? right;
  T value;
  bool isLeaf;

  TreeNode(this.value, this.left, this.right) : isLeaf = false;
  TreeNode.sole(this.value)
      : left = null,
        right = null,
        isLeaf = true;

  void setLeftChild(TreeNode leftChild) {
    this.left = leftChild;
  }

  void setRightChild(TreeNode rightChild) {
    this.right = rightChild;
  }
}
