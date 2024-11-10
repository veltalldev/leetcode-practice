import 'dart:collection';

/// 20241027
///
/// This solution makes use of two rather unique insights
/// 1. Similar to the core logic of the Knights and Knaves riddle, whenever
///    data passes through the queue and the stack, the order is reversed.
///    This implies the ability to restore original ordering by doing so twice.
/// 2. A reverse sequence of length 1 has the same order, therefore:
///    a. processing a sequence of values ONE-VALUE-AT-A-TIME will preserve
///       the order of those values (with the additional effect of moving
///       them to the back of the queue)
///    b. processing a sequence of values in a chain will reverse the order
///       therein (also with the additional effect of moving them to the back
///       of the queue)
/// 3. The revised/improved strategy is to:
///    a. rotate the top n-1 values to pair up the largest above the smallest
///    b. rotate the top n-2 values to position the next smallest value at the
///       new "bottom"
///    c. repeat until n-(n-1) values.
/// 4. Example:
///    12345 -> 5432 in queue -> 15432
///    15432 -> 234  in queue -> 15243
///    15234 -> 43   in queue -> 15243
///
/// 5. This algorithm runs in O(n^2) time, specifically, for each group size k
///    - The stack pops k times and pushes k times
///    - The queue enqueues k times and dequeues k times
///    For a total of 4k operations, with k ranging from 1 to n-1
///    1 + (n-1) + 2 + (n-2) + ... + n/2 + n/2 = n * n/2 = n^2/2
///    Therefore, the runtime is specifically 2n^2
/// 6. Per the requirements of the problem, this solution uses only one
///    queue as temporary storage and staging area for the data manipulation.
///    The size of the queue is exactly the number of items to be processed, so
///    O(n).

void interleave(Stack stack) {
  if (stack.size < 3) return;
  final queue = Queue();

  for (var i = stack.size - 1; i > 0; i--) {
    // rotate the top block of size i
    for (var j = 1; j <= i; j++) {
      queue.add(stack.pop());
    }
    for (var j = 1; j <= i; j++) {
      stack.push(queue.removeFirst());
    }
  }
  return;
}

/// A simple Stack implementation to facilitate the solution
class Stack<T> {
  final List<T> _stack;

  Stack() : _stack = <T>[];
  Stack.fromList(List<T> list) : _stack = <T>[] {
    _stack.addAll(list);
  }

  void push(T value) {
    _stack.add(value);
  }

  T pop() {
    if (isEmpty) {
      throw Exception("Stack is empty.");
    }
    return _stack.removeLast();
  }

  bool get isEmpty => _stack.isEmpty;
  bool get isNotEmpty => _stack.isNotEmpty;
  int get size => _stack.length;

  @override
  String toString() => _stack.toString();
  List<T> toList() => <T>[]..addAll(_stack);
}
