/// 20241007
///
/// Building off of ideas from the naive solution, I'm aiming to generate
/// the perfect numbers directly without enumerating and checking
///
/// Strategy:
///   - Overflow observation:
///     - consider a perfect number k, represented by its digits
///     - there must be a position i where the prefix sum (from 0 to i)
///       adds up to 10
///     - logically, all digits to the right of i have to be 0
///     - therefore the only way to increase k is to overflow at position
///       i and increase position i-1
///   - Overflowing at i will increase i-1 by 1 (in most cases) and yield
///     a "budget" of `10 - (arr[i-1] + 1)`, which is to be distributed
///     among the remaining digits on the right (including i).
///   - This distribution, named `P(b, d)` considers all possible permutations
///     of distribution of value `b` into `d` places.
///   - This then turns into a recursion problem where `P(b, d) = i * P(b-i, d)`
///   - Thus we build the solutions in a bottom up manner (memoization)
///   - and reduce the work of finding `P(b-i, d)` to `O(1)` runtime.

int findPerfectNumber(int n) {
  final allPerfectNumbers = <int>[19];

  while (allPerfectNumbers.length < n) {
    _fillPerfectNumbers(allPerfectNumbers);
  }

  allPerfectNumbers.sort();
  return allPerfectNumbers[n - 1];
}

void _fillPerfectNumbers(List<int> allPerfectNumbers) {
  final currentPerfectNumber = allPerfectNumbers[allPerfectNumbers.length - 1];
  List<int> currentDigits = _convertNumberToDigits(currentPerfectNumber);
  int prefixSum = 0;
  int overflowPosition = currentDigits.indexWhere((i) {
    prefixSum += i;
    return prefixSum == 10;
  });
  int prev = overflowPosition - 1;

  // perform overflow updates
  currentDigits[prev] += 1;
  if (currentDigits[prev] == 10) {
    currentDigits[prev - 1] = 1;
    currentDigits[prev] = 0;
  }
  currentDigits.fillRange(overflowPosition, currentDigits.length, 0);

  // find budget
  int budget = 10 - currentDigits.reduce((a, b) => a + b);
  fillBudget(allPerfectNumbers, currentDigits, budget, overflowPosition);
}

void fillBudget(
  List<int> allPerfectNumbers,
  List<int> digitList,
  int budget,
  int overflowPosition,
) {
  List<int> newPerfectNumber = List.from(digitList);

  // base case: only one way to distribute budget
  if (overflowPosition == 9) {
    newPerfectNumber[9] = budget;
    allPerfectNumbers.add(_convertDigitsToNumber(newPerfectNumber));
    return;
  }

  // recursion: current position can have values 0 through budget
  //            the remaining amount is distributed among the rest
  for (var b = 0; b <= budget; b++) {
    newPerfectNumber[overflowPosition] = b;
    fillBudget(
      allPerfectNumbers,
      newPerfectNumber,
      budget - b,
      overflowPosition + 1,
    );
  }
}

List<int> _convertNumberToDigits(int currentPerfectNumber) {
  var digits =
      currentPerfectNumber.toString().split('').map(int.parse).toList();
  digits = List.filled(10 - digits.length, 0) + digits;
  return digits;
}

int _convertDigitsToNumber(List<int> digitList) {
  return int.parse(digitList.map((i) => i.toString()).join(''));
}
