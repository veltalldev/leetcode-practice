/// 20240922
/// This is a rather standard linked list manipulation problem
/// The key idea is to create new links before losing connection to the
/// nodes you need to handle

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

class MyStack<T> {
  List<T> _stack = <T>[];

  void push(T element) {
    _stack.add(element);
  }

  T? pop() {
    if (_stack.isEmpty) {
      return null;
    }
    return _stack.removeLast();
  }

  T? peek() {
    if (_stack.isEmpty) {
      return null;
    }
    return _stack.last;
  }

  bool isEmpty() => _stack.isEmpty;
  bool isNotEmpty() => _stack.isNotEmpty;
  int size() => _stack.length;
  @override
  String toString() {
    return _stack.map((e) => e.toString()).join();
  }
}

/// The process involves iterating through the list, setting each node’s
/// `next` pointer to point to the previous node (reversing the link),
/// and updating the pointers to move forward.
/// This continues until all nodes have been reversed, and the function
/// finally returns the new root.
LinkedListNode reverseLinkedListIterative(LinkedListNode root) {
  if (root.next == null) {
    return root;
  }
  if (root.next!.next == null) {
    // only 2 nodes, reverse manually
    var newRoot = root.next;
    newRoot!.linkTo(root);
    root.next = null;
    return newRoot;
  }
  var prev = root;
  var current = prev.next;
  var next = current!.next;
  prev.next = null;
  while (current != null) {
    current.linkTo(prev);
    prev = current;
    current = next;
    if (current != null) {
      next = current.next;
    }
  }
  return prev;
}

// this function utilizes a stack to reverse the order of traversal
LinkedListNode reverseLinkedListStack(LinkedListNode root) {
  var current = root;
  final stack = MyStack<LinkedListNode>();
  while (current.hasNext()) {
    stack.push(current);
    current = current.next!;
  }
  // currently processing the last node
  // proceed to reverse-link
  var newRoot = current;
  while (stack.isNotEmpty()) {
    var pop = stack.pop()!;
    current.linkTo(pop);
    current = current.next!;
  }
  current.next = null; // trim off the tail
  return newRoot;
}
