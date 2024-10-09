/// 20241005
/// Just a simple recursion check

// returns the sum value and its frequency
int _subtreeSums(TreeNode<int>? root, Map<int, int> freqMap) {
  if (root == null) {
    return 0;
  }

  // recursion
  final leftSum = _subtreeSums(root.left, freqMap);
  final rightSum = _subtreeSums(root.right, freqMap);

  final currentSum = root.value + leftSum + rightSum;
  freqMap[currentSum] = (freqMap[currentSum] ?? 0) + 1;

  return currentSum;
}

int subtreeSums(TreeNode<int>? root) {
  if (root == null) return 0;

  final freqMap = <int, int>{};

  _subtreeSums(root, freqMap);

  int maxFreq = 0;
  int maxSum = 0;
  freqMap.forEach((sum, freq) {
    if (maxFreq < freq) {
      maxSum = sum;
      maxFreq = freq;
    }
  });
  return maxSum;
}

class TreeNode<T> {
  T value;
  TreeNode<T>? left;
  TreeNode<T>? right;

  TreeNode(this.value, {this.left, this.right});
}
