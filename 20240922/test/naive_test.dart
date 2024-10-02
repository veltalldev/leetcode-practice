import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('Reverse LinkedList with Stack', () {
    test('Reverses a list of 3 elements', () {
      // Arrange
      final node3 = LinkedListNode(3);
      final node2 = LinkedListNode(2)..linkTo(node3);
      final node1 = LinkedListNode(1)..linkTo(node2);

      // Act
      final newRoot = reverseLinkedListStack(node1);

      // Assert
      expect(newRoot.value, equals(3));
      expect(newRoot.next!.value, equals(2));
      expect(newRoot.next!.next!.value, equals(1));
      expect(newRoot.next!.next!.next, isNull);
    });

    test('Reverses a list of 1 element', () {
      // Arrange
      final node1 = LinkedListNode(1);

      // Act
      final newRoot = reverseLinkedListStack(node1);

      // Assert
      expect(newRoot.value, equals(1));
      expect(newRoot.next, isNull);
    });

    test('Reverses a list of 2 elements', () {
      // Arrange
      final node2 = LinkedListNode(2);
      final node1 = LinkedListNode(1)..linkTo(node2);

      // Act
      final newRoot = reverseLinkedListStack(node1);

      // Assert
      expect(newRoot.value, equals(2));
      expect(newRoot.next!.value, equals(1));
      expect(newRoot.next!.next, isNull);
    });
  });
  group('Reverse LinkedList Recursively', () {
    test('Reverses a list of 3 elements', () {
      // Arrange
      final node3 = LinkedListNode(3);
      final node2 = LinkedListNode(2)..linkTo(node3);
      final node1 = LinkedListNode(1)..linkTo(node2);

      // Act
      final newRoot = reverseLinkedListIterative(node1);

      // Assert
      expect(newRoot.value, equals(3));
      expect(newRoot.next!.value, equals(2));
      expect(newRoot.next!.next!.value, equals(1));
      expect(newRoot.next!.next!.next, isNull);
    });

    test('Reverses a list of 1 element', () {
      // Arrange
      final node1 = LinkedListNode(1);

      // Act
      final newRoot = reverseLinkedListIterative(node1);

      // Assert
      expect(newRoot.value, equals(1));
      expect(newRoot.next, isNull);
    });

    test('Reverses a list of 2 elements', () {
      // Arrange
      final node2 = LinkedListNode(2);
      final node1 = LinkedListNode(1)..linkTo(node2);

      // Act
      final newRoot = reverseLinkedListIterative(node1);

      // Assert
      expect(newRoot.value, equals(2));
      expect(newRoot.next!.value, equals(1));
      expect(newRoot.next!.next, isNull);
    });
  });
}
