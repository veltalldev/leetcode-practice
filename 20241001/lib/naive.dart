import 'dart:math';

/// 20241001
///
/// Because of the lack of requirement for contiguity in the palindrone,
/// this problem has a lot of complexity baked in. The only appropriate
/// solution to manage the inherent exponential growth nature is Dynamic
/// Programming. We reduce the problem of "longest palindromic subseq" into
/// smaller, similar subproblems of "longest palindrome" for a smaller string
/// and build up a partial solution from a base case to the full problem
///
/// Base case: a subseq of length 1 is palindromic

int longestPalindromeSubseq(String s) {
  final n = s.length;
  if (n == 0) return 0;
  final dp = List.generate(n, (_) => List.filled(n, 0));
  for (var i = 0; i < n; i++) {
    dp[i][i] = 1; // string of length 1 is palindromic
  }

  for (var subseqLength = 2; subseqLength <= n; subseqLength++) {
    // sliding window from 0 to n of length L
    for (var i = 0; i <= n - subseqLength; i++) {
      final j = i + subseqLength - 1;

      if (s[i] == s[j]) {
        // if match, contract the window on both sides until base case
        dp[i][j] = 2 + dp[i + 1][j - 1];
      } else {
        // if not match, make the better choice between i and j
        dp[i][j] = max(dp[i + 1][j], dp[i][j - 1]);
      }
    }
  }

  return dp[0][n - 1];
}
