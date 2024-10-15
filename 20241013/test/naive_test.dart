import 'package:test/test.dart';
import 'package:leetcode20241013/naive.dart';

void main() {
  group('First Recurring Character Tests', () {
    test('Should return first recurring character', () {
      expect(firstRecurringCharacter("acbbac"), equals("b"));
    });

    test('Should return null when there is no recurring character', () {
      expect(firstRecurringCharacter("abcdef"), equals(null));
    });

    test('Should handle a single recurring character', () {
      expect(firstRecurringCharacter("aabbcc"), equals("a"));
    });

    test('Should return first recurring character in longer string', () {
      expect(firstRecurringCharacter("abcbdefg"), equals("b"));
    });

    test('Should return null for empty string', () {
      expect(firstRecurringCharacter(""), equals(null));
    });
  });
}
