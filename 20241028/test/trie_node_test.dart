import 'package:test/test.dart';
import 'package:leetcode20241028/src/trie/trie_node.dart';

void main() {
  group('TrieNode', () {
    late TrieNode node;

    setUp(() {
      node = TrieNode(); // called every test
    });

    test('should initialize with empty children and !isEndOfWord', () {
      expect(node.children, isEmpty);
      expect(node.isEndOfWord, isFalse);
    });

    group('hasChild', () {
      test('should return false for non-existent child', () {
        expect(node.hasChild('a'), isFalse);
      });
      test('should return true for existing child', () {
        node.addChild('a');
        expect(node.hasChild('a'), isTrue);
      });
    });

    group('getChild', () {
      test('should return null for non-existent child', () {
        expect(node.getChild('a'), isNull);
      });
      test('should return child node for existing child', () {
        final child = node.addChild('a');
        expect(node.getChild('a'), equals(child));
      });
    });

    group('addChild', () {
      test('should create new child node if none exists', () {
        final child = node.addChild('a');
        expect(child, isNotNull);
        expect(node.children['a'], equals(child));
      });

      test('should return existing child if already exists', () {
        final firstChild = node.addChild('a');
        final secondChild = node.addChild('a');
        expect(secondChild, equals(firstChild));
        expect(node.children.length, equals(1));
      });

      test('should create distinct nodes for different characters', () {
        final childA = node.addChild('a');
        final childB = node.addChild('b');
        expect(node.children.length, equals(2));
        expect(childA, isNot(equals(childB)));
      });
    });

    // integration
    test('should support multiple levels of children', () {
      final childA = node.addChild('a');
      final childB = childA.addChild('b');
      final childC = childB.addChild('c');

      expect(node.hasChild('a'), isTrue);
      expect(childA.hasChild('b'), isTrue);
      expect(childB.hasChild('c'), isTrue);
      expect(childC.children, isEmpty);
    });
  });
}
