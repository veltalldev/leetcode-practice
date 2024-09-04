/// one naive idea is to use the second stack as a "reverse" bucket.
/// This effectively means that compared to a proper queue, our implementation
/// - takes the same time to enqueue N items, O(1) each
/// - takes ONE extra O(n) operation to dequeue N items, which is
///   effectively still O(1) each on average

import 'package:test/test.dart';

void main() {
  group('Queue using two stacks', () {
    test('Enqueue and dequeue a single element', () {
      var queue = Queue<int>();
      queue.enqueue(1);
      expect(queue.dequeue(), equals(1));
    });

    test('Enqueue multiple elements and dequeue them in FIFO order', () {
      var queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      expect(queue.dequeue(), equals(1));
      expect(queue.dequeue(), equals(2));
      expect(queue.dequeue(), equals(3));
    });

    test('Dequeue on an empty queue should throw an exception', () {
      var queue = Queue<int>();
      expect(() => queue.dequeue(), throwsException);
    });

    test('Enqueue and dequeue multiple times', () {
      var queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.dequeue(), equals(1));
      queue.enqueue(3);
      expect(queue.dequeue(), equals(2));
      expect(queue.dequeue(), equals(3));
    });

    test('Peek should return the front element without removing it', () {
      var queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.peek(), equals(1)); // Peek without dequeuing
      expect(queue.dequeue(),
          equals(1)); // Check if dequeue is still in FIFO order
      expect(queue.peek(), equals(2));
    });

    test('Queue size should increase and decrease correctly', () {
      var queue = Queue<int>();
      expect(queue.size, equals(0)); // Initially empty
      queue.enqueue(1);
      expect(queue.size, equals(1));
      queue.enqueue(2);
      expect(queue.size, equals(2));
      queue.dequeue();
      expect(queue.size, equals(1));
      queue.dequeue();
      expect(queue.size, equals(0));
    });

    test('Dequeue all elements and check if the queue is empty', () {
      var queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      queue.dequeue();
      queue.dequeue();
      queue.dequeue();
      expect(queue.isEmpty(),
          isTrue); // Should return true if all elements are dequeued
    });
  });
}

// ==============================================================
// ==============================================================
// ==============================================================

class Queue<T> {
  final s1 = Stack<T>();
  final s2 = Stack<T>();

  Queue();

  void enqueue(T value) {
    s1.push(value);
  }

  T dequeue() {
    peek();
    return s2.pop();
  }

  T peek() {
    if (s2.isEmpty()) {
      transferData();
    }
    return s2.peek();
  }

  void transferData() {
    while (!s1.isEmpty()) {
      s2.push(s1.pop());
    }
  }

  int get size => s1.size + s2.size;
  bool isEmpty() => s1.isEmpty() && s2.isEmpty();
}

class Stack<T> {
  final List<T> _stack = [];

  void push(T value) {
    _stack.add(value);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw Exception("Stack is empty");
    }
    return _stack.removeLast();
  }

  T peek() {
    if (_stack.isEmpty) {
      throw Exception("Stack is empty");
    }
    return _stack.last;
  }

  bool isEmpty() {
    return _stack.isEmpty;
  }

  int get size => _stack.length;
}
