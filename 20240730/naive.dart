/// At the risk of sounding uninformed, it seems to me that
/// an actual tree of arbitrary size cannot take constant time to generate.
/// One could hypothetically set the runtime to be ridiculously large to
/// accommodate trees of sizes smaller than that, but it is trivial to come up
/// with such a tree that exceeds any finite provisions imaginable.
///
/// On the other hand, dealing with an unbounded amount of stuff brings to mind
/// the thought experiment of the Hilbert's Hotel. Perhaps we can generate a
/// "hypothetical" tree that uses mathematical indexing to represent its nodes.
/// This way, the tree can store any amount of information without the actual
/// tree being physically manifested in memory. This allows for the tree to be both
/// - unbounded in size
/// - generated in O(1) time (as far as the user can tell)
///
/// we can then associate the unique indexing of each node to the content
/// it's supposed to store in a map.

class HilbertBinaryTree<T> {
  final Map<int, T> _data = {};

  // all methods that return a node in this tree will return its index
  int generate() {
    return 0; // root of the tree
  }

  //
  // ─── INTERNAL LOGIC ───────────────────────────────────────────────────────────
  //

  // Mathematically, the parent's index is 2^L where L is the layer
  // and the children's indices are 2^(L+1), therefore 2x the parent's
  int getLeft(int nodeIndex) {
    return nodeIndex * 2 + 1;
  }

  int getRight(int nodeIndex) {
    return nodeIndex * 2 + 2;
  }

  int getParent(int nodeIndex) {
    return (nodeIndex - 1) ~/ 2;
  }

  void setValue(int nodeIndex, T value) {
    _data[nodeIndex] = value;
  }

  void unsetValue(int nodeIndex) {
    _data.remove(nodeIndex);
  }

  T? getValue(int nodeIndex) {
    return _data[nodeIndex];
  }

  bool containsValue(int nodeIndex) {
    return _data.containsKey(nodeIndex);
  }

  //
  // ─── EXTERNAL BINARY TREE INTERFACE ───────────────────────────────────────────
  //
  void insert(T value) {
    int index = _data.length;
    setValue(index, value);
  }

  // Find the index of a node with a given value
  int findIndex(T searchValue) {
    try {
      return _data.entries
          .firstWhere(
            (entry) => entry.value == searchValue,
            orElse: () => throw ValueNotFoundException(
              'Node with value $searchValue does not exist.',
            ),
          )
          .key;
    } on ValueNotFoundException catch (e) {
      print(e);
      return -1;
    }
  }

  // delete by value
  void delete(T value) {
    int index = findIndex(value);
    if (index != -1) {
      deleteByIndex(index);
    }
  }

  void deleteByIndex(int index) {
    int lastIndex = _data.length - 1;
    if (index == lastIndex) {
      // simply remove
      _data.remove(index);
    } else {
      // move the last node into the missing spot, then remove the empty tail
      _data[index] = _data[lastIndex]!;
      _data.remove(lastIndex);
    }
  }

  void printTree() {
    _data.forEach((index, value) {
      print('Index $index: $value');
    });
  }

  // functional in-order traversal
  void inOrderTraversal(int index, Function(T value) action) {
    if (_data.containsKey(index)) {
      inOrderTraversal(getLeft(index), action);
      action(_data[index]!);
      inOrderTraversal(getRight(index), action);
    }
  }
}

class ValueNotFoundException implements Exception {
  final String message;
  ValueNotFoundException(this.message);

  @override
  String toString() => 'ValueNotFoundException: $message';
}

//
// ─── TEST CASES ─────────────────────────────────────────────────────────────────
//

//   void main() {
//   HilbertBinaryTree<int> tree = HilbertBinaryTree<int>();

//   tree.insert(10);
//   tree.insert(5);
//   tree.insert(20);
//   tree.insert(3);
//   tree.insert(7);
//   tree.insert(15);
//   tree.insert(30);

//   print('Tree before deletion:');
//   tree.printTree();

//   tree.delete(3); // Delete the node with value 3
//   print('Tree after deleting node with value 3:');
//   tree.printTree();

//   tree.delete(10); // Delete the root node
//   print('Tree after deleting root node:');
//   tree.printTree();

//   print('In-order traversal:');
//   tree.inOrderTraversal(0, print);
// }

//
// ─── GPT TEST CASES ─────────────────────────────────────────────────────────────
//

void main() {
  HilbertBinaryTree<int> tree = HilbertBinaryTree<int>();

  // Test case 1: Insert values and verify insertion
  tree.insert(10);
  tree.insert(5);
  tree.insert(20);
  tree.insert(3);
  tree.insert(7);
  tree.insert(15);
  tree.insert(30);

  print('Tree after insertions:');
  tree.printTree();
  assert(tree.getValue(0) == 10);
  assert(tree.getValue(1) == 5);
  assert(tree.getValue(2) == 20);
  assert(tree.getValue(3) == 3);
  assert(tree.getValue(4) == 7);
  assert(tree.getValue(5) == 15);
  assert(tree.getValue(6) == 30);

  // Verify in-order traversal before any deletion
  List<int> traversalResult = [];
  tree.inOrderTraversal(0, (value) => traversalResult.add(value));
  print('In-order traversal before deletion: $traversalResult');
  assert(traversalResult.join(',') == '3,5,7,10,15,20,30');

  // Test case 2: Delete a node by value (3)
  tree.delete(3);
  traversalResult.clear();
  tree.inOrderTraversal(0, (value) => traversalResult.add(value));
  print('Tree after deleting node with value 3:');
  tree.printTree();
  print('In-order traversal after deleting 3: $traversalResult');
  assert(traversalResult.join(',') == '30,5,7,10,15,20');

  // Test case 3: Delete the root node (10)
  tree.delete(10);
  traversalResult.clear();
  tree.inOrderTraversal(0, (value) => traversalResult.add(value));
  print('Tree after deleting root node:');
  tree.printTree();
  print('In-order traversal after deleting 10: $traversalResult');
  assert(traversalResult.join(',') == '30,5,7,15,20');

  // Test case 4: Find index of a value (7)
  int index = tree.findIndex(7);
  print('Index of node with value 7: $index');
  assert(index == 4);

  // Test case 5: Check parent, left, and right indices
  int root = tree.generate();
  assert(tree.getLeft(root) == 1);
  assert(tree.getRight(root) == 2);
  assert(tree.getParent(1) == 0);
  assert(tree.getParent(2) == 0);
  assert(tree.getParent(4) == 1);

  // Test case 6: Check setting and unsetting values
  tree.setValue(10, 50);
  assert(tree.getValue(10) == 50);
  tree.unsetValue(10);
  assert(!tree.containsValue(10));

  print('All test cases passed!');
}
