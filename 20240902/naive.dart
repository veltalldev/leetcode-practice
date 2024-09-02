/// this is a relatively simple problem for people with a
/// math background. Division is simply repeated subtraction.
import 'package:test/test.dart';

int divide(int a, int b) {
  // handle edge case
  if (b == 0) {
    throw Exception("Divisor cannot be 0");
  }
  // a sensible default, if the dividend is smaller than the divisor, we get 0
  var quotient = 0;
  while (a >= b) {
    quotient++;
    a = a - b;
  }
  return quotient;
}

void main() {
  group('Custom Division Function Tests', () {
    test('Test Case 1: Simple division', () {
      expect(divide(10, 2), equals(5));
    });

    test('Test Case 2: Division where dividend equals divisor', () {
      expect(divide(7, 7), equals(1));
    });

    test('Test Case 3: Division resulting in zero (dividend < divisor)', () {
      expect(divide(3, 10), equals(0));
    });

    test('Test Case 4: Large dividend', () {
      expect(divide(1000000, 10), equals(100000));
    });

    test('Test Case 5: Small divisor', () {
      expect(divide(100, 1), equals(100));
    });

    test('Test Case 6: Division where divisor is a large number', () {
      expect(divide(1, 1), equals(1));
    });

    test('Test Case 7: Larger dividend and divisor', () {
      expect(divide(123456789, 123), equals(1003713)); // Correct quotient
    });

    test('Test Case 8: Power of two division', () {
      expect(divide(64, 8), equals(8));
    });

    test('Test Case 9: Large numbers', () {
      expect(divide(2147483647, 2),
          equals(1073741823)); // Max positive value for 32-bit int
    });

    test('Test Case 10: Minimum dividend and divisor (both are 1)', () {
      expect(divide(1, 1), equals(1));
    });
  });
}
