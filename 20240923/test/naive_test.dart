import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('Partition Linked List Around Pivot', () {
    bool isPartitionedCorrectly(LinkedListNode? root, int k) {
      bool passedPivot = false;
      while (root != null) {
        if (root.value >= k) {
          passedPivot = true;
        } else if (passedPivot) {
          // Found an element less than k after passing pivot zone
          return false;
        }
        root = root.next;
      }
      return true;
    }

    test('Partitions the list around pivot 3', () {
      // Arrange
      final node5 = LinkedListNode(5);
      final node1 = LinkedListNode(1)..next = node5;
      final node8 = LinkedListNode(8)..next = node1;
      final node0 = LinkedListNode(0)..next = node8;
      final node3 = LinkedListNode(3)..next = node0;

      // Act
      final result = partitionLinkedListAroundPivot(node3, 3);

      // Assert
      expect(isPartitionedCorrectly(result, 3), isTrue);
    });

    test('All elements are less than k', () {
      // Arrange
      final node2 = LinkedListNode(2);
      final node1 = LinkedListNode(1)..next = node2;
      final node0 = LinkedListNode(0)..next = node1;

      // Act
      final result = partitionLinkedListAroundPivot(node0, 3);

      // Assert
      expect(isPartitionedCorrectly(result, 3), isTrue);
    });

    test('All elements are greater than or equal to k', () {
      // Arrange
      final node7 = LinkedListNode(7);
      final node5 = LinkedListNode(5)..next = node7;
      final node4 = LinkedListNode(4)..next = node5;

      // Act
      final result = partitionLinkedListAroundPivot(node4, 3);

      // Assert
      expect(isPartitionedCorrectly(result, 3), isTrue);
    });

    test('Single element list', () {
      // Arrange
      final node = LinkedListNode(2);

      // Act
      final result = partitionLinkedListAroundPivot(node, 3);

      // Assert
      expect(isPartitionedCorrectly(result, 3), isTrue);
    });

    test('Empty list', () {
      // Act
      final result = partitionLinkedListAroundPivot(null, 3);

      // Assert
      expect(result, isNull);
    });
  });
}
