import 'package:test/test.dart';
import 'package:leetcode20241012/naive.dart';

// Helper function to check if the sequence satisfies the comparison array
bool isValidSequence(List<int> sequence, List<String> comparisonArray) {
  for (int i = 1; i < sequence.length; i++) {
    var comparison = comparisonArray[i];
    if (comparison == '+') {
      if (sequence[i] <= sequence[i - 1]) return false; // Should be increasing
    } else if (comparison == '-') {
      if (sequence[i] >= sequence[i - 1]) return false; // Should be decreasing
    }
  }
  return true;
}

void main() {
  group('Reconstruct Sequence from Comparison Array', () {
    test('Basic increasing and decreasing sequence', () {
      List<String> comparisonArray = ["None", '+', '+', '-', '+'];
      List<int> result = reconstructSequence(comparisonArray);
      expect(isValidSequence(result, comparisonArray), equals(true));
    });

    test('All increasing sequence', () {
      List<String> comparisonArray = ["None", '+', '+', '+', '+'];
      List<int> result = reconstructSequence(comparisonArray);
      expect(isValidSequence(result, comparisonArray), equals(true));
    });

    test('All decreasing sequence', () {
      List<String> comparisonArray = ["None", '-', '-', '-', '-'];
      List<int> result = reconstructSequence(comparisonArray);
      expect(isValidSequence(result, comparisonArray), equals(true));
    });

    test('Alternating signs sequence', () {
      List<String> comparisonArray = ["None", '+', '-', '+', '-'];
      List<int> result = reconstructSequence(comparisonArray);
      expect(isValidSequence(result, comparisonArray), equals(true));
    });

    test('Single comparison', () {
      List<String> comparisonArray = ["None", '+'];
      List<int> result = reconstructSequence(comparisonArray);
      expect(isValidSequence(result, comparisonArray), equals(true));
    });
  });
}
