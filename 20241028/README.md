# Trie-based Autocomplete Implementation

A Dart implementation of a Trie (prefix tree) data structure optimized for autocomplete functionality. This implementation provides efficient prefix-based string searching with configurable behavior for empty prefix handling.

## Features

- **Word Insertion**: Add complete words to the trie
- **Prefix Search**: Find all words that match a given prefix
- **Membership Testing**: Check if a complete word exists in the trie
- **Configurable Empty Prefix**: Control behavior when searching with empty prefix
- **Unicode Support**: Properly handles special characters and Unicode strings

## Project Structure

```
lib/
└── src/
    └── trie/
        ├── trie_node.dart  # Basic node structure
        └── trie.dart       # Main trie implementation
test/
└── trie_test.dart
└── trie_node_test.dart
```

## Usage

```dart
// Create a new trie
final trie = Trie();

// Insert some words
trie.insert('test');
trie.insert('team');
trie.insert('tea');

// Search for words with prefix
final results = trie.findWordsWithPrefix('te');  // Returns ['test', 'team', 'tea']

// Check if a word exists
final exists = trie.contains('test');  // Returns true

// Search with empty prefix (configurable)
final allWords = trie.findWordsWithPrefix('', includeEmptyPrefix: true);  // Returns all words
```

## Implementation Details

### TrieNode Class
- Map-based children storage for efficient lookups
- Boolean flag for word completion marking
- Methods for child node management

### Trie Class
- Efficient prefix-based word searching
- Configurable empty prefix behavior
- Complete word membership testing
- Word count tracking for debugging

## Testing

The implementation includes a comprehensive test suite covering:
- Basic operations (insertion, searching)
- Edge cases (empty strings, Unicode characters)
- Configuration options
- Multiple word interactions

Run tests using:
```bash
dart test
```

## Learning Outcomes

This project demonstrates:
- Trie data structure implementation
- Clean code practices in Dart
- Comprehensive testing approaches
- Git workflow with feature branches and PRs
- Professional documentation
