// this file implements a naive solution for testing the
// Collatz conjecture

void main() {
  List<bool> testResults = testCollatzUpTo(10);
  print(testResults);
}

List<bool> testCollatzUpTo(int maxNum) {
  List<bool> testResults = [];
  for (var i = 1; i <= maxNum; i++) {
    testResults.add(testCollatz(i));
  }
  return testResults;
}

bool testCollatz(int i) {
  Set<num> observedNumbers = Set<num>();
  bool repeat = false;
  while (!repeat) {
    num next = getNextCollatzNumber(i);
    if (next == 1) {
      return true;
    }
    if (observedNumbers.contains(next)) {
      repeat = true;
      break;
    } else
      observedNumbers.add(next);
  }
  return !repeat;
}

num getNextCollatzNumber(num inputNum) {
  num nextNum = -1;
  if (inputNum % 2 == 0) {
    nextNum = inputNum / 2;
  } else
    nextNum = 3 * inputNum - 1;
  return nextNum;
}
