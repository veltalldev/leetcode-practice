import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('findLargestContiguousSum', () {
    test('Handles positive and negative numbers', () {
      expect(findLargestContiguousSum([34, -50, 42, 14, -5, 86]), equals(137));
    });

    test('Handles all negative numbers', () {
      expect(findLargestContiguousSum([-5, -1, -8, -9]), equals(0));
    });

    test('Handles all positive numbers', () {
      expect(findLargestContiguousSum([1, 2, 3, 4, 5]), equals(15));
    });

    test('Handles a single negative number', () {
      expect(findLargestContiguousSum([-10]), equals(0));
    });

    test('Handles a single positive number', () {
      expect(findLargestContiguousSum([10]), equals(10));
    });

    test('Handles an empty array', () {
      expect(findLargestContiguousSum([]), equals(0));
    });

    test('Handles alternating positive and negative numbers', () {
      expect(findLargestContiguousSum([2, -1, 2, 3, -4, 5]), equals(7));
    });
    test('doublecheck the mirrored situation', () {
      expect(findLargestContiguousSum([5, -4, 3, 2, -1, 2]), equals(7));
    });
    test('triplecheck the mirrored situation', () {
      expect(
          findLargestContiguousSum([34, -50, 42, 14, -5, 86].reversed.toList()),
          equals(137));
    });
  });
}
