import 'package:leetcode20241028/src/trie/trie_node.dart';

/// A Trie (prefix tree) data structure for efficient string prefix searches
///
/// This implementation provides functionality for:
/// - Inserting words into the trie
/// - Searching for words with a given prefix
/// - Checking if a complete word exists in the trie
class Trie {
  final TrieNode _root;

  /// Creates a new empty Trie with a root node.
  Trie() : _root = TrieNode();

  /// Inserts a word into the trie.
  ///
  /// Each character of the word is added as a node in the tree if it doesn't
  /// already exists. The last node is marked as the end of a word.
  void insert(String word) {
    var current = _root;

    for (var char in word.split('')) {
      current = current.addChild(char);
    }

    current.isEndOfWord = true;
  }

  /// Searches for all words in the trie that start with the given prefix
  ///
  /// Returns:
  ///   A list of all words that start with the given prefix.
  ///   An empty list if no words are found with the given prefix.
  List<String> findWordsWithPrefix(String prefix,
      {bool includeEmptyPrefix = false}) {
    if (prefix.isEmpty && !includeEmptyPrefix) return <String>[];
    var current = _root;
    var results = <String>[];

    /// Navigate through the prefix word
    for (var char in prefix.split('')) {
      var child = current.getChild(char);
      if (child == null) {
        return results; // child node does not exist for [char]
      }
      current = child; // traverse one letter down
    }

    // flatten the current subtree to collect all words from here down
    _collectWords(current, prefix, results);
    return results;
  }

  /// Helper method to flatten the current subtree and collect all
  /// well-formed words henceforth.
  ///
  /// Parameters:
  ///   - currentNode: the root of the current subtree
  ///   - currentString: the current state of the prefix string
  ///   - results: the collection of words to add to
  void _collectWords(
    TrieNode currentNode,
    String currentString,
    List<String> results,
  ) {
    if (currentNode.isEndOfWord) {
      results.add(currentString);
    }

    /// recursively call child processes
    for (var entry in currentNode.children.entries) {
      _collectWords(entry.value, currentString + entry.key, results);
    }
  }

  /// Checks for membership of a complete word.
  /// Only returns true for complete words, not existing prefixes.
  ///
  /// Returns:
  ///   true if the word exists in the trie, false otherwise.
  bool contains(String word) {
    var current = _root;

    for (var char in word.split('')) {
      var child = current.getChild(char);
      if (child == null) {
        return false;
      }
      current = child; // traverse further
    }
    // done with traversal, the prefix is in the trie
    // needs additional check for completeness as a word
    return current.isEndOfWord;
  }

  /// Returns the number of compelte words stored in the trie.
  ///
  /// This is a helper method primarily useful for testing/debugging.
  int get wordCount {
    var count = 0;

    /// recursive routine to modify the "global" count
    void countWords(TrieNode node) {
      if (node.isEndOfWord) count++;
      node.children.values.forEach(countWords);
    }

    countWords(_root);
    return count;
  }
}
