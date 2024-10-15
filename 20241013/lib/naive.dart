/// 20241013
///
/// This is a straightforward membership check problem. We use a
/// set for fast insertions and membership test. Additionally,
/// we could use a bloom filter for even faster operations at the
/// cost of a very small number of false positives.

String? firstRecurringCharacter(String input) {
  final characterSet = <String>{};
  for (var char in input.split('')) {
    if (characterSet.contains(char)) {
      return char;
    }
    characterSet.add(char);
  }
  return null;
}
