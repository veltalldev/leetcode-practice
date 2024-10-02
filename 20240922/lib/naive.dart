import 'dart:io';

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

// this function recursively calls the next part of the list and assumes that
// it has already been reversed, so it finishes the reversal by linking the
// returned tail of the list to the node currently being processed, which
// becomes the new tail and is returned
LinkedListNode reverseLinkedListRecursive(LinkedListNode root) {
  LinkedListNode current = root;
  if (current.hasNext()) {
    var next = reverseLinkedListRecursive(current.next!);
    next.linkTo(current); // reverse the link
  }
  return current;
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
