import 'package:test/test.dart';
import 'package:leetcode20241007/naive.dart';

void main() {
  group('Perfect Number Tests', () {
    test('Test Case 1: First Perfect Number', () {
      expect(findPerfectNumber(1), equals(19));
    });

    test('Test Case 2: Second Perfect Number', () {
      expect(findPerfectNumber(2), equals(28));
    });

    test('Test Case 3: Third Perfect Number', () {
      expect(findPerfectNumber(3), equals(37));
    });

    test('Test Case 4: Fourth Perfect Number', () {
      expect(findPerfectNumber(4), equals(46));
    });

    test('Test Case 5: Fifth Perfect Number', () {
      expect(findPerfectNumber(5), equals(55));
    });

    test('Test Case 6: Larger Number', () {
      expect(findPerfectNumber(10), equals(109));
    });
  });
}
