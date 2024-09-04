/// implement a stack using a maxheap
/// My initial idea is to give each item being pushed in an ID, then utilize
/// the Heap property to surface the newest item to the top, ready to be popped

import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  group('Stack<T>', () {
    test('should push and pop items correctly', () {
      var stack = Stack<String>();

      stack.push('apple');
      stack.push('banana');
      stack.push('orange');

      expect(stack.pop(), equals('orange'));
      expect(stack.pop(), equals('banana'));
      expect(stack.pop(), equals('apple'));
    });

    test('should throw an exception when popping from an empty stack', () {
      var stack = Stack<int>();

      expect(() => stack.pop(), throwsA(isA<Exception>()));
    });

    test('should peek at the top item without removing it', () {
      var stack = Stack<int>();

      stack.push(1);
      stack.push(2);
      stack.push(3);

      expect(stack.peek(), equals(3));
      expect(stack.size(), equals(3)); // Ensure the stack size remains the same
    });

    test('should correctly return if the stack is empty', () {
      var stack = Stack<double>();

      expect(stack.isEmpty(), isTrue);

      stack.push(3.14);
      expect(stack.isEmpty(), isFalse);

      stack.pop();
      expect(stack.isEmpty(), isTrue);
    });

    test('should return the correct size of the stack', () {
      var stack = Stack<int>();

      expect(stack.size(), equals(0));

      stack.push(5);
      expect(stack.size(), equals(1));

      stack.push(10);
      expect(stack.size(), equals(2));

      stack.pop();
      expect(stack.size(), equals(1));
    });

    test('should handle generic types correctly', () {
      var stack = Stack<Map<String, int>>();

      stack.push({'apple': 5});
      stack.push({'banana': 10});

      var poppedItem = stack.pop();
      expect(poppedItem, equals({'banana': 10}));

      poppedItem = stack.pop();
      expect(poppedItem, equals({'apple': 5}));
    });
  });
}

// ================================================================
// ================================================================
// ================================================================

class Stack<T> {
  final _minHeap = HeapPriorityQueue<_ItemWithID<T>>(
    // internal compare-by-ID logic to expose item with min ID
    (p0, p1) => p1.compareTo(p0),
  );
  int _idCounter = 0;
  Stack();

  // ==============
  // Conventional Stack API
  void push(T item) {
    _minHeap.add(_ItemWithID(_idCounter++, item));
  }

  T pop() {
    if (isEmpty()) throw Exception("Stack is empty, cannot pop.");
    return _minHeap.removeFirst().value;
  }

  T peek() => _minHeap.first.value;

  bool isEmpty() => _minHeap.isEmpty;

  int size() => _minHeap.length;

  @override
  String toString() {
    return "Stack(items: $_minHeap)";
  }
}

class _ItemWithID<T> implements Comparable<_ItemWithID<T>> {
  final int id;
  final T value;

  _ItemWithID(this.id, this.value);

  @override
  int compareTo(_ItemWithID<T> other) {
    return id.compareTo(other.id);
  }

  @override
  String toString() {
    return "(id: $id, v: $value)";
  }
}
