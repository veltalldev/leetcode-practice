import 'dart:math';

/// 20241024

class TreeNode {
  final List<TreeNode> children;
  final List<int> weights;

  TreeNode()
      : children = <TreeNode>[],
        weights = <int>[];

  void addChild(TreeNode child, int weight) {
    children.add(child);
    weights.add(weight);
  }

  bool isLeaf() => children.length == 0;
}

// recursive helper
int findMaxPathLengthInTree(TreeNode root) {
  final (maxTo, maxThrough) = _findMaxPathLengthInTree(root);
  return max(maxTo, maxThrough);
}

// recursive routine
(int, int) _findMaxPathLengthInTree(TreeNode current) {
  // base case
  if (current.isLeaf()) {
    return (0, 0);
  }

  // 1. recursively call child nodes to get and store their information
  final childrenInfo = current.children.map((childNode) {
    return _findMaxPathLengthInTree(childNode);
  });
  final toValues = <int>[];
  final throughValues = <int>[];
  for (var childInfo in childrenInfo) {
    final (maxTo, maxThrough) = childInfo;
    toValues.add(maxTo);
    throughValues.add(maxThrough);
  }

  // 2. calculate current level's to and through values
  var maxTo1 = 0;
  var maxTo2 = 0;
  for (var i = 0; i < toValues.length; i++) {
    final toValue = toValues[i] + current.weights[i]; // make the connection
    // print("Updated toValue for child $i: $toValue");
    if (maxTo1 < toValue) {
      maxTo2 = maxTo1;
      maxTo1 = toValue;
    } else if (maxTo2 < toValue) {
      // keep maxTo1 the same, update maxTo2
      maxTo2 = toValue;
    }
  }
  final currentMaxTo = maxTo1;
  final currentMaxThrough = maxTo1 + maxTo2;
  final globalMaxThrough = [...throughValues, currentMaxThrough].reduce(max);

  return (currentMaxTo, globalMaxThrough);
}
