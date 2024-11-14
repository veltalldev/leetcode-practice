import 'package:test/test.dart';
import 'package:leetcode20241028/src/trie/trie.dart';

void main() {
  group('trie', () {
    late Trie trie;

    setUp(() {
      trie = Trie();
    });

    // init test
    test('initialized trie should contains no words', () {
      final count = trie.wordCount;
      expect(count, equals(0));
    });

    group('insert', () {
      test('singleton insert', () {
        trie.insert('test');
        expect(trie.contains('test'), isTrue);
        expect(trie.wordCount, equals(1));
      });
      test('many inserts', () {
        final words = "hello world from the other side";
        final wordList = words.split(" ");
        wordList.forEach((word) => trie.insert(word));
        wordList.forEach((word) => expect(
              trie.contains(word),
              isTrue,
            ));
        expect(trie.wordCount, equals(wordList.length));
      });

      test('duplicate word insertion', () {
        trie.insert('test');
        trie.insert('test');
        expect(trie.wordCount, equals(1));
      });

      test('empty string insertion', () {
        trie.insert('');
        expect(trie.contains(''), isTrue);
        expect(trie.wordCount, equals(1));
      });
    });
    group('contains', () {
      setUp(() {
        trie.insert('test');
        trie.insert('membership');
        trie.insert('trie');
      });

      test('existing complete words', () {
        expect(trie.contains('test'), isTrue);
        expect(trie.contains('membership'), isTrue);
        expect(trie.contains('trie'), isTrue);
      });

      test('non-existent words', () {
        expect(trie.contains('word'), isFalse);
        expect(trie.contains('cap'), isFalse);
        expect(trie.contains('sheeesh'), isFalse);
      });

      test('incomplete words / prefix only', () {
        expect(trie.contains('te'), isFalse);
        expect(trie.contains('she'), isFalse);
      });
    });

    group('findWordsWithPrefix', () {
      late List<String> words;
      setUp(() {
        words = "test team tea testing teammate".split(' ');
        words.forEach(trie.insert);
      });

      test('find all words with prefix `te`', () {
        final prefix = 'te';
        final searchResults = trie.findWordsWithPrefix(prefix);
        expect(searchResults.length, equals(words.length));
        expect(searchResults, containsAll(words));
      });

      test('find subset of words with longer prefix `tea`', () {
        final prefix = 'tea';
        final searchResults = trie.findWordsWithPrefix(prefix);
        expect(searchResults.length, equals(3));
      });

      test('finds single word with exact match', () {
        final prefix = 'teammate';
        final searchResults = trie.findWordsWithPrefix(prefix);
        expect(searchResults.length, equals(1));
        expect(trie.contains('teammate'), isTrue);
      });

      test('non-matching prefix', () {
        final badPrefix = 'badPrefix';
        final searchResults = trie.findWordsWithPrefix(badPrefix);
        expect(searchResults, isEmpty);
      });

      test('returns empty list for empty prefix (default)', () {
        final searchResults = trie.findWordsWithPrefix('');
        expect(searchResults, isEmpty);
      });

      test('returns full list for empty prefix with flag', () {
        final searchResults = trie.findWordsWithPrefix(
          '',
          includeEmptyPrefix: true,
        );
        expect(searchResults.length, equals(words.length));
      });
    });

    group('edge cases', () {
      test('case sensitivity', () {
        trie.insert('Test');
        expect(trie.contains('Test'), isTrue);
        expect(trie.contains('test'), isFalse);
      });

      test('special characters', () {
        trie.insert('password1234!');
        expect(trie.contains('password1234'), isFalse);
        expect(trie.contains('password1234!'), isTrue);
      });

      test('unicode characters', () {
        trie.insert('café');
        trie.insert('résumé');
        expect(trie.contains('café'), isTrue);
        expect(trie.contains('cafe'), isFalse);
        var words = trie.findWordsWithPrefix('ré');
        expect(words, contains('résumé'));
      });
    });
  });
}
