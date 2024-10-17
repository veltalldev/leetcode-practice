/// 20241016
///
/// I had to consult the standard solution for this as my monkey brain
/// could only come up with the brute force solution using a stack and
/// three-way branches.
///
/// The O(n) solution makes clever use of the idea that branches in the
/// condition don't need to be explicitly tracked, only accounted for
/// via a count. Each wildcard character * causes the lowest count of
/// the open parenthesis to diverge further from the highest count,
/// because the low count assumes that * becomes a closing parenthesis,
/// and the high count assumes that * becomes an open parenthesis.
///
/// Since they are the two extreme of the possible values for the
/// open parenthesis character, several observations hold true trivially:
///   - if high < 0, this then is an impossible situation (having more
///     closes than opens even when making the most open-friendly choices).
///     No further development can remedy this situation,
///     so we immediately return `false`.
///   - if low < 0, this just means that we have been too ambitious
///     with assigning the wildcard * to become a close parenthesis,
///     we simply set low = 0 to account for one such * that shouldn't
///     have become ).
///   - At the end of the loop, if `high > 0`, then it's natural.
///     If we make an open-friendly choice at every turn, of course
///     our highest possible scenario will likely have leftover opens
///   - However, if `low > 0` then we cannot balance the parentheses,
///     because `low` is already our most aggressive count. If closing
///     the parenthesis at every turn we have a choice is not enough,
///     then balancing is impossible.
///   - This means that the only configs that can balance the parentheses
///     are the ones that have the `low` count at 0.

bool checkBalancedParentheses(String s) {
  // lowest count of open parentheses
  var low = 0;
  // highest count
  var high = 0;

  for (var symbol in s.split("")) {
    switch (symbol) {
      case "(":
        // found unambiguous open parenthesis, increment both
        low++;
        high++;
        break;
      case ")":
        // found unambiguous close, decrement both
        low--;
        high--;
        break;
      default:
        // diverge to track both cases
        low--;
        high++;
    }
    if (high < 0) return false;
    if (low < 0) low = 0;
  }
  return (low == 0);
}
