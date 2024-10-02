import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('Power of 4 Tests', () {
    test('Test valid powers of 4', () {
      // Valid powers of 4
      expect(isPowerOf4(1), isTrue); // 4^0 = 1
      expect(isPowerOf4(4), isTrue); // 4^1 = 4
      expect(isPowerOf4(16), isTrue); // 4^2 = 16
      expect(isPowerOf4(64), isTrue); // 4^3 = 64
      expect(isPowerOf4(256), isTrue); // 4^4 = 256
    });

    test('Test non-powers of 4', () {
      // Invalid powers of 4
      expect(isPowerOf4(0), isFalse); // Edge case: 0 is not a power of 4
      expect(isPowerOf4(2), isFalse); // 2 is not a power of 4
      expect(isPowerOf4(8), isFalse); // 8 is a power of 2, but not 4
      expect(isPowerOf4(10), isFalse); // 10 is not a power of 4
      expect(isPowerOf4(32), isFalse); // 32 is a power of 2, but not 4
      expect(isPowerOf4(20), isFalse); // 20 is not a power of 4
    });

    test('Test edge cases', () {
      // Edge cases
      expect(isPowerOf4(2147483647), isFalse); // Largest 32-bit positive int
      expect(isPowerOf4(-4), isFalse); // Negative numbers cannot be powers of 4
    });
  });
}
