import 'package:test/test.dart';
import 'package:leetcode20241016/naive.dart';

void main() {
  group('checkBalancedParentheses tests', () {
    // Test case 1: Balanced with *
    test('Test case 1: "(()*" should return true', () {
      expect(checkBalancedParentheses("(()*"), isTrue);
    });

    // Test case 2: Balanced with * replacing ()
    test('Test case 2: "(*)" should return true', () {
      expect(checkBalancedParentheses("(*)"), isTrue);
    });

    // Test case 3: Unbalanced with misplaced parentheses
    test('Test case 3: ")*(" should return false', () {
      expect(checkBalancedParentheses(")*("), isFalse);
    });

    // Test case 4: Balanced with multiple *
    test('Test case 4: "(**)" should return true', () {
      expect(checkBalancedParentheses("(**)"), isTrue);
    });

    // Test case 5: All * treated as empty
    test('Test case 5: "(*()" should return true', () {
      expect(checkBalancedParentheses("(*()"), isTrue);
    });

    // Test case 6: Unbalanced with more closing parentheses
    test('Test case 6: "(()))" should return false', () {
      expect(checkBalancedParentheses("(()))"), isFalse);
    });

    // Test case 7: Empty string (balanced)
    test('Test case 7: "" (empty string) should return true', () {
      expect(checkBalancedParentheses(""), isTrue);
    });
  });
}
