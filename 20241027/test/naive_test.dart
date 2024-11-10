import 'package:test/test.dart';
import 'package:leetcode20241027/naive.dart';

void main() {
  group('Testing interleave pattern', () {
    test('Generic case: simple ordered list', () {
      final stack = Stack.fromList([1, 2, 3, 4, 5]);
      print("test case 1: stack = $stack");
      interleave(stack);
      print("finished interleave: stack = $stack");
      expect(stack.toList(), orderedEquals([1, 5, 2, 4, 3]));
    });
    test('Edge case: empty stack', () {
      final stack = Stack<int>();
      interleave(stack);
      expect(stack.toList(), orderedEquals(<int>[]));
    });
    test('Edge case: single value stack', () {
      final stack = Stack<int>()..push(143);
      interleave(stack);
      expect(stack.toList(), [143]);
    });
    test('Edge case: 2 value stack', () {
      final stack = Stack.fromList(<int>[143, 69]);
      interleave(stack);
      expect(stack.toList(), [143, 69]);
    });
  });
  group('Testing basic Stack operations', () {
    test("Single push and pop", () {
      final stack = Stack();
      stack.push(143);
      expect(stack.pop(), equals(143));
    });

    test('pushing and popping several items', () {
      final stack = Stack();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.push(4);
      stack.push(5);
      stack.push(6);
      final list = <int>[];
      while (stack.isNotEmpty) {
        list.add(stack.pop());
      }
      expect(list, orderedEquals([6, 5, 4, 3, 2, 1]));
    });
  });
}
