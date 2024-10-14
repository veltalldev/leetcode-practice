import 'package:test/test.dart';
import 'package:leetcode20241010/naive.dart';

void main() {
  group('Target Sum Tests', () {
    test('Test case 1: Example with multiple ways to reach target', () {
      expect(targetSum([1, 1, 1, 1, 1], 3), equals(5));
    });

    test('Test case 2: Single element equals target', () {
      expect(targetSum([1], 1), equals(1));
    });

    test('Test case 3: Single element does not equal target', () {
      expect(targetSum([1], 2), equals(0));
    });

    test('Test case 4: Array with negative target', () {
      expect(targetSum([1, 2, 1], -2), equals(2));
    });

    test('Test case 5: Empty array should return 0 ways', () {
      expect(targetSum([], 0), equals(0));
    });

    test('Test case 6: Larger array with valid combinations', () {
      expect(targetSum([2, 3, 1, 4, 2], 6), equals(3));
    });

    test('Test case 7: Array with multiple elements where target is 0', () {
      expect(targetSum([1, 2, 1, 2], 0), equals(4));
    });
  });
}
