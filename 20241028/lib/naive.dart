/// 20241028
///
///
void main() {
  final testDictionary = [
    // Words starting with 'de'
    'deer', 'deal', 'deep', 'defeat', 'december',

    // Words starting with 'do'
    'dog', 'door', 'document', 'dolphin', 'domain',

    // Words starting with 'da'
    'data', 'dark', 'dance', 'dash', 'date',

    // Other 'd' words
    'drum', 'drift', 'dream', 'draft', 'drink',

    // Non 'd' words for variety
    'cat', 'car', 'care', 'careful', 'career',
    'bear', 'beach', 'begin', 'behind', 'better',
    'apple', 'apply', 'approve', 'april', 'area'
  ];

  // Sort the dictionary for better readability
  testDictionary.sort();

  // Print dictionary statistics
  printDictionaryStats(testDictionary);
}

void printDictionaryStats(List<String> dictionary) {
  // Using a Map to store words by prefix
  final prefixes = <String, List<String>>{};

  for (final word in dictionary) {
    if (word.length >= 2) {
      final prefix = word.substring(0, 2);
      prefixes.putIfAbsent(prefix, () => []);
      prefixes[prefix]!.add(word);
    }
  }

  // Print statistics
  print('Total words: ${dictionary.length}\n');
  print('Words by prefix:');

  // Sort prefixes for consistent output
  final sortedPrefixes = prefixes.keys.toList()..sort();

  for (final prefix in sortedPrefixes) {
    final words = prefixes[prefix]!;
    print('$prefix-: ${words.length} words - $words');
  }
}
