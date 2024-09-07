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
  group('Performance tests for findLargestContiguousSum', () {
    group('Performance tests for findLargestContiguousSum', () {
      // Helper function to measure the execution time of findLargestContiguousSum
      int measureExecutionTime(List<int> input) {
        final startTime = DateTime.now();
        findLargestContiguousSum(input); // Replace with your solution function
        final endTime = DateTime.now();
        return endTime.difference(startTime).inMilliseconds;
      }

      test('should exhibit linear growth for increasing input sizes', () {
        int size1 = 30000000;
        int size2 = 60000000;
        int size3 = 240000000;
        final input1 = List.generate(size1, (index) => index % 100 - 50);
        final time1 = measureExecutionTime(input1);

        final input2 = List.generate(size2, (index) => index % 100 - 50);
        final time2 = measureExecutionTime(input2);

        final input3 = List.generate(size3, (index) => index % 100 - 50);
        final time3 = measureExecutionTime(input3);

        // Printing out the times for visual comparison (optional)
        print('Execution time for input size $size1: $time1 ms');
        print('Execution time for input size $size2: $time2 ms');
        print('Execution time for input size $size3: $time3 ms');

        // Compare the runtime ratios between different input sizes
        final ratio1 = time2 / time1;
        final ratio2 = time3 / time2;

        // Expect the ratios to be roughly linear
        final goal1 = 2;
        final goal2 = 4;
        final tolerance = 0.1; // 10% tolerance
        expect(ratio1, lessThanOrEqualTo(goal1 * (1 + tolerance)),
            reason:
                'Runtime for $size2 should be roughly ${goal1}x that for $size1.');
        expect(ratio2, lessThanOrEqualTo(goal2 * (1 + tolerance)),
            reason:
                'Runtime for $size3 should be roughly ${goal2}x that for $size2.');
      });
    });
  });
}
