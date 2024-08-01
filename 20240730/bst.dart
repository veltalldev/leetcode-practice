import 'naive.dart';

class HilbertBST<T extends Comparable> extends HilbertBinaryTree<T> {
  @override
  void insert(T value) {
    int index = 0;
    if (data.isEmpty) {
      setValue(index, value);
      return;
    }
    while (true) {
      int next;
      if (value.compareTo(data[index]) < 0) {
        next = getLeft(index);
      } else {
        // tie break inserts to right child
        next = getRight(index);
      }
      if (!data.containsKey(next)) {
        // next node empty, just insert
        setValue(next, value);
        break;
      } else {
        index = next; // return to loop
      }
    }
  }

  @override
  void delete(T value) {
    int index = findIndex(value);
    if(index != -1) {
      deleteByIndex(index);
    }
    _adjustSubtree(index);
  }

  /// resursive routine to swap the values of this node and one of its two 
  /// direct children, then repeat one layer deeper 
  void _adjustSubtree(int index) {
    int left = getLeft(index);
    int right = getRight(index);
    int minIndex;

    if(data.containsKey(left) && data.containsKey(right)) {
      minIndex = (data[left]!.compareTo(data[right]) < 0) ? left : right;
    } else if(data.containsKey(left)) {
      minIndex = left;
    } else if(data.containsKey(right)) {
      minIndex = right;
    } else {
      return;   // done adjusting, base recursion case
    }

    if(data[index]!.compareTo(data[minIndex]!) > 0) {
      /// perform swap
      T temp = data[index]!;
      data[index] = data[minIndex]!;
      data[minIndex] = temp;
      _adjustSubtree(minIndex); // next layer
    }
  }
}


//
// ─── GPT TEST CASES ─────────────────────────────────────────────────────────────
//

  
void main() {
  HilbertBST<int> tree = HilbertBST<int>();

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

  // Test case 2: Find index of a value (7)
  int index = tree.findIndex(7);
  print('Index of node with value 7: $index');
  assert(index == 4);

  // Test case 3: Delete a node by value (3)
  tree.delete(3);
  traversalResult.clear();
  tree.inOrderTraversal(0, (value) => traversalResult.add(value));
  print('Tree after deleting node with value 3:');
  tree.printTree();
  print('In-order traversal after deleting 3: $traversalResult');
  assert(traversalResult.join(',') == '5,7,10,15,20,30');

  // Test case 4: Delete the root node (10)
  tree.delete(10);
  traversalResult.clear();
  tree.inOrderTraversal(0, (value) => traversalResult.add(value));
  print('Tree after deleting root node:');
  tree.printTree();
  print('In-order traversal after deleting 10: $traversalResult');
  assert(traversalResult.join(',') == '5,7,15,20,30');

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
