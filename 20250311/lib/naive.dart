import 'dart:math';

/// 20250311
/// Start 8:35pm
///
/// So my first thought is that this is a classic junior problem that's very frequently encountered during prep, so I'll acknowledge that I have seen it before and have learned the stack solution from it instead of coming up with it from first principles on my own. That said, I do understand that the nested nature of the "parentheses" lends itself to a LIFO order of pairing/resolution. This matches the operational order of a stack, so using a stack to simulate the current state of the symbol string is appropriate.
///
///The idea is relatively simple, we process the string sequentially, and for each opening symbol, we push it onto the stack. When we encounter a closing symbol, we attempt to pop it from the stack and handle the various cases that can happen at this point as well as when the stack is empty or the input is empty.

class Stack<T> {
  final _stack = <T>[];

  get size => _stack.length;
  get isEmpty => size == 0;
  get isNotEmpty => !isEmpty;

  void push(T value) {
    _stack.add(value);
  }

  T pop() {
    if (isEmpty) {
      throw StateError("Attempting to pop an empty stack.");
    } else {
      return _stack.removeLast();
    }
  }
}

void main() {
  final input1 = "()";
  final output1 = true;
  final input2 = "()[]{}";
  final output2 = true;
  final input3 = "(]";
  final output3 = false;
  final input4 = "([)]";
  final output4 = false;
  final input5 = "{[]}";
  final output5 = true;

  test(input1, output1);
  test(input2, output2);
  test(input3, output3);
  test(input4, output4);
  test(input5, output5);

  print("All tests passed");
}

void test(String str, bool expected) {
  final isValidResult = isValidBracketSequence(str);
  assert(expected == isValidResult);
}

bool isValidBracketSequence(String str) {
  final stack = Stack<String>();
  final symbols = <String, String>{
    '(': ')',
    '[': ']',
    '{': '}',
  };

  final charList = str.split('');
  for (var c in charList) {
    if (symbols.containsKey(c)) {
      stack.push(c);
    } else if (symbols.containsValue(c)) {
      if (stack.isEmpty) return false; // case 1: too many closes
      final expectedClose = symbols[stack.pop()];
      if (c != expectedClose) {
        return false; // case 2: mismatching pairs
      }
    } else {
      // case 3: illegal character, probably return false
      return false;
    }
  }
  // case 4: too many opens
  if (stack.isNotEmpty) return false;

  // otherwise should be valid
  return true;
}

/// Finished at 9:00pm

/// Extension: track maximum nested depth

int findMaxNestDepth(String str) {
  final stack = Stack<String>();
  final symbols = <String, String>{
    '(': ')',
    '[': ']',
    '{': '}',
  };

  final charList = str.split('');
  int maxDepth = 0;

  for (var c in charList) {
    if (symbols.containsKey(c)) {
      stack.push(c);
      maxDepth = max(maxDepth, stack.size);
    } else {
      stack.pop();
    }
  }
  return maxDepth;
}
