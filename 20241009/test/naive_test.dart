import 'package:test/test.dart';
import 'package:leetcode20241009/naive.dart';

void main() {
  group('Partition Equal Subset Sum Tests', () {
    test(
        'Test case 1: Array can be partitioned into two subsets with equal sum',
        () {
      expect(equalPartitionSums([1, 5, 11, 5]), isTrue);
    });

    test(
        'Test case 2: Array cannot be partitioned into two subsets with equal sum',
        () {
      expect(equalPartitionSums([1, 2, 3, 5]), isFalse);
    });

    test('Test case 3: Empty array should return false', () {
      expect(equalPartitionSums([]), isFalse);
    });

    test('Test case 4: Array with one element cannot be partitioned', () {
      expect(equalPartitionSums([1]), isFalse);
    });

    test('Test case 5: Array with two equal elements should return true', () {
      expect(equalPartitionSums([7, 7]), isTrue);
    });

    test('Test case 6: Large array with possible partitioning', () {
      expect(equalPartitionSums([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]), isFalse);
    });

    test('Test case 7: Array with no possible partition', () {
      expect(equalPartitionSums([1, 2, 5]), isFalse);
    });
  });
}
