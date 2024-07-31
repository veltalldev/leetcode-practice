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
    return nodeIndex - 1 ~/ 2;
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
    return _data.entries
        .firstWhere(
          (entry) => entry.value == searchValue,
          orElse: () => MapEntry(-1, searchValue),
        )
        .key;
  }
}
