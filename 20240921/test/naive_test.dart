import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('minimumDifferenceRounding tests', () {
    test('Test case 0: Example case', () {
      expect(minimumDifferenceRounding([1.2, 2.3, 4.5]), equals([1, 2, 5]));
    });
    test('Test case 1: Simple case, no rounding needed', () {
      expect(minimumDifferenceRounding([1.0, 2.0, 3.0]), equals([1, 2, 3]));
    });

    test('Test case 2: Mixed rounding up and down, sum constraint', () {
      expect(minimumDifferenceRounding([1.4, 2.6, 3.7, 4.3]),
          equals([1, 3, 4, 4]));
    });

    test('Test case 3: All values require rounding up', () {
      expect(minimumDifferenceRounding([0.9, 1.8, 2.3]),
          equals([1, 2, 2])); // sum = 5
    });

    test('Test case 4: Small fractional parts, mostly rounding down', () {
      expect(minimumDifferenceRounding([1.1, 2.2, 3.7]),
          equals([1, 2, 4])); // sum = 7
    });

    test('Test case 5: Larger fractional parts, forced rounding up', () {
      expect(minimumDifferenceRounding([1.9, 2.1, 3.0]),
          equals([2, 2, 3])); // sum = 7
    });

    test('Test case 6: Single element array with rounding up', () {
      expect(minimumDifferenceRounding([1.5]), equals([2])); // sum = 2
    });

    test(
        'Test case 7: Equal fractional parts, different rounding to satisfy sum constraint',
        () {
      expect(minimumDifferenceRounding([1.5, 2.5, 3.5]),
          equals([1, 3, 4])); // sum = 9
    });

    test('Test case 8: Large array, mixed rounding', () {
      expect(minimumDifferenceRounding([1.2, 2.5, 3.3, 4.0, 5.0, 2.0]),
          equals([1, 3, 3, 4, 5, 2])); // sum = 18
    });

    test('Test case 9: Array with exact values and fractional values', () {
      expect(minimumDifferenceRounding([2.0, 3.5, 4.0, 5.2, 1.3]),
          equals([2, 3, 4, 5, 2])); // sum = 16
    });

    test(
        'Test case 10: Edge case, single element array with no rounding needed',
        () {
      expect(minimumDifferenceRounding([5.0]), equals([5])); // sum = 5
    });
  });
}
