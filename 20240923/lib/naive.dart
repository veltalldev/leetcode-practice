/// 20240923
/// ### Problem: Partition a Linked List Around a Pivot
///
/// I don't know how to justify my solution for this problem, it just came
/// to me. We make use of two pointers to build two separate linked lists,
/// one of values above the pivot `k` and one below. Then we join them.

class LinkedListNode<T> {
  final T value;
  LinkedListNode<T>? next;

  LinkedListNode(this.value) : next = null;

  void linkTo(LinkedListNode<T> other) {
    next = other;
  }

  bool hasNext() => next != null;

  T get data => value;

  @override
  String toString() {
    return " [$value] -> ";
  }
}

LinkedListNode? partitionLinkedListAroundPivot(LinkedListNode? root, int k) {
  if (root == null) {
    return null;
  }
  LinkedListNode? current = root;
  LinkedListNode? rootBig = null;
  LinkedListNode? rootSmall = null;
  while (current != null) {
    if (current.value >= k) {
      append(rootBig, current);
    } else {
      append(rootSmall, current);
    }
    current = current.next;
  }
  // stitch the two lists together, small to the left
  current = rootSmall;
  if (current == null) {
    return rootBig;
  } else if (current.next == null) {
    current.next = rootBig;
    return current;
  } else {
    // has at least 2 nodes, can traverse
    while (current!.next != null) {
      current = current.next;
    }
    current.next = rootBig;
  }
  return rootSmall;
}

// add newNode to the linked list at the root position
void append(LinkedListNode? root, LinkedListNode newNode) {
  if (root == null) {
    root = newNode;
  } else {
    newNode.next = root;
    root = newNode;
  }
}
