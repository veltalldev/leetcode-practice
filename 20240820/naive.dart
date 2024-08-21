import 'dart:math';
import 'package:test/test.dart';

/// this appears to be a relatively simple problem. A fair RNG that produces 7 values already
/// assigns uniform probability for values 1-5, so there is no additional work to perform
/// beside simply ignoring values 6 and 7

int rand7() {
  Random random = Random();
  return random.nextInt(7) + 1; // 1-7 inclusive
}

int rand5() {
  int r = rand7();
  if (r < 6) {
    return r;
  }
  return rand5();
}

void main(List<String> args) {
  group("rand5()", () {
    int testRuns = 10000;
    test("All values should be within range of 1-5 inclusive", () {
      for (var i = 0; i < testRuns; i++) {
        int random = rand5();
        expect(random, inInclusiveRange(1, 5));
      }
    });

    test("Probability distribution should be uniform within 5% tolerance", () {
      double tolerance = 0.05; // 5% deviation tolerance
      double expectedCount = testRuns / 5; // expectation

      Map<int, int> resultCount = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
      for (var i = 0; i < testRuns; i++) {
        int random = rand5();
        resultCount[random] = resultCount[random]! + 1; // reality
      }


      for (var i = 1; i <= 5; i++) {
        double deviation = (resultCount[i]! - expectedCount).abs();
        expect(deviation, lessThan(testRuns * tolerance));
      }
    });
  });
}
