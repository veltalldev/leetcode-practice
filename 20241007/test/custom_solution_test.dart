import 'package:test/test.dart';
import 'package:leetcode20241007/custom_solution.dart';

void main() {
  group('Perfect Number Tests', () {
    test('Test Case 1: First Perfect Number', () {
      expect(findPerfectNumber(1), equals(19)); // First perfect number is 19
    });

    test('Test Case 2: Second Perfect Number', () {
      expect(findPerfectNumber(2), equals(28)); // Second perfect number is 28
    });

    test('Test Case 3: Third Perfect Number', () {
      expect(findPerfectNumber(3), equals(37)); // Third perfect number is 37
    });

    test('Test Case 4: Fourth Perfect Number', () {
      expect(findPerfectNumber(4), equals(46)); // Fourth perfect number is 46
    });

    test('Test Case 5: Fifth Perfect Number', () {
      expect(findPerfectNumber(5), equals(55)); // Fifth perfect number is 55
    });

    test('Test Case 6: Tenth Perfect Number', () {
      expect(findPerfectNumber(10), equals(109)); // Tenth perfect number is 109
    });

    test('Test Case 7: Larger n - 20th Perfect Number', () {
      expect(findPerfectNumber(20),
          equals(208)); // Twentieth perfect number is 208
    });
  });
}
