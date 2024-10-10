/// 20241007
///
/// I'll implement the obvious naive solution and one I spent some time
/// on. Firstly, some observations:
///   - There can be at most 1b ish such numbers, because 1,111,111,111 has
///     to be the last one
///   - They don't really follow any "counting" pattern because as the
///     left digits grow, the patterns from previous ranges
///     break down from not being able to grow as much
///   - every attempt to increase the value and find the next perfect number
///     involves some manner of digit overflowing.

int findPerfectNumber(int n) {
  return List.generate(1111111111, (i) => i)
      .where((i) => isPerfectNumber(i))
      .toList()[n - 1];
}

bool isPerfectNumber(int value) {
  int digitSum = 0;
  while (value >= 1) {
    final digitValue = value % 10;
    digitSum += digitValue;
    value = value ~/ 10;
  }

  return digitSum == 10;
}
