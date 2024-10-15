import 'package:test/test.dart';
import 'package:leetcode20241001/naive.dart';

void main() {
  group('Longest Palindromic Subsequence Tests', () {
    test('Test case 1: Longest palindromic subsequence in "bbbab"', () {
      expect(longestPalindromeSubseq("bbbab"), equals(4));
    });

    test('Test case 2: Longest palindromic subsequence in "cbbd"', () {
      expect(longestPalindromeSubseq("cbbd"), equals(2));
    });

    test('Test case 3: Single character string should return 1', () {
      expect(longestPalindromeSubseq("a"), equals(1));
    });

    test('Test case 4: Long string with repeating characters', () {
      expect(longestPalindromeSubseq("abcabcabc"), equals(5));
    });

    test(
        'Test case 5: Palindromic string should return the length of the string',
        () {
      expect(longestPalindromeSubseq("racecar"), equals(7));
    });

    test('Test case 6: String with no repeating characters', () {
      expect(longestPalindromeSubseq("abcdef"), equals(1));
    });
  });
}
