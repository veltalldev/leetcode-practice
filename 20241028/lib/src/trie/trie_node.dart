/// A node in a trie data structure.
///
/// Each node represents a character in the trie and maintains:
/// - A map of child nodes for subsequent characters
/// - A flag indicating if this node represents the end of a word
///   (so that we can distinguish `run` and `running` from inbetween
///   strings)
class TrieNode {
  /// Maps characters to their corresponding child nodes
  final Map<String, TrieNode> children = {};

  /// Whether this nodes represents the end of a word
  bool isEndOfWord = false;

  /// Creates a new TrieNode instance
  TrieNode();

  /// Whether this node has a child represented by [char]
  bool hasChild(String char) => children.containsKey(char);

  /// Gets the child node represented by [char]
  ///
  /// Returns the child [TrieNode] if it exists, null otherwise
  TrieNode? getChild(String char) => children[char];

  /// Adds a child node with [char] as its representation if it doesn't exist
  ///
  /// Returns the existing or newly created child node
  TrieNode addChild(String char) {
    return children.putIfAbsent(char, () => TrieNode());
  }
}
