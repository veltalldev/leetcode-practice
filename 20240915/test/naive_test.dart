import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('minimalCoveringSet tests', () {
    test('Test case 1: Simple case with overlapping intervals', () {
      expect(minimalCoveringSet([(1, 4), (2, 5), (3, 6)]),
          allOf(contains(4), hasLength(1)));
    });

    test('Test case 2: Non-overlapping intervals', () {
      expect(minimalCoveringSet([(1, 2), (3, 4), (5, 6)]), equals({2, 4, 6}));
    });

    test('Test case 3: Fully nested intervals', () {
      expect(minimalCoveringSet([(1, 10), (2, 9), (3, 8)]), equals({8}));
    });

    test('Test case 4: Partially overlapping intervals', () {
      expect(
          minimalCoveringSet([(1, 3), (2, 6), (5, 7), (8, 10)]), hasLength(3));
    });

    test('Test case 5: Intervals with shared endpoints', () {
      expect(minimalCoveringSet([(1, 5), (5, 10), (10, 15)]), hasLength(2));
    });

    test('Test case 6: Single interval', () {
      expect(minimalCoveringSet([(1, 5)]), equals({5}));
    });

    test('Test case 7: Large intervals covering small ones', () {
      expect(minimalCoveringSet([(1, 10), (2, 3), (4, 5)]), equals({3, 5}));
    });

    test('Test case 8: Empty intervals list', () {
      expect(minimalCoveringSet([]), equals(<int>{}));
    });
  });
}
