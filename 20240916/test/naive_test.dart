import 'package:test/test.dart';
import '../lib/naive.dart'; // Adjust this to the actual file where your `minimumJump` function is implemented.

void main() {
  group('minimumJump tests', () {
    test('Test case 1: Example from the problem', () {
      expect(minimumJump([6, 2, 4, 0, 5, 1, 1, 4, 2, 9]), equals(2));
    });

    test('Test case 2: Single element array', () {
      expect(minimumJump([0]), equals(0));
    });

    test('Test case 3: Two element array', () {
      expect(minimumJump([1, 1]), equals(1));
    });

    test('Test case 4: Maximum jump from the first element', () {
      expect(minimumJump([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]), equals(1));
    });

    test('Test case 5: Reachable array with zeroes', () {
      expect(minimumJump([3, 2, 1, 1, 4, 2, 1, 5, 0, 1]), equals(4));
    });

    test('Test case 6: Only need one jump', () {
      expect(minimumJump([5, 1, 1, 1, 1, 1]), equals(1));
    });

    test('Test case 7: Jumps at maximum capacity (all elements are 1)', () {
      expect(minimumJump([1, 1, 1, 1, 1, 1, 1, 1]), equals(7));
    });

    test('Test case 8: Larger jump and small jumps thereafter', () {
      expect(minimumJump([4, 1, 1, 1, 1, 1]), equals(2));
    });

    test('Test case 9: Reachable with 3 jumps', () {
      expect(minimumJump([2, 3, 1, 1, 4, 2, 1, 1, 3]), equals(3));
    });

    test('Test case 10: Large step first, followed by steps of size 1', () {
      expect(minimumJump([5, 1, 1, 1, 1]), equals(1));
    });
  });
}
