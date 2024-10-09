import 'package:test/test.dart';
import 'package:leetcode20241006/naive.dart';

// Helper function to convert a list to a linked list
ListNode<T>? createLinkedList<T>(List<T> values) {
  if (values.isEmpty) return null;
  ListNode<T> head = ListNode(values[0]);
  ListNode<T> current = head;
  for (int i = 1; i < values.length; i++) {
    current.next = ListNode(values[i]);
    current = current.next!;
  }
  return head;
}

// Helper function to convert a linked list back to a list
List<T> linkedListToList<T>(ListNode<T>? head) {
  List<T> result = [];
  ListNode<T>? current = head;
  while (current != null) {
    result.add(current.value);
    current = current.next;
  }
  return result;
}

void main() {
  test('Rotate linked list by 0 rotations', () {
    ListNode<int>? head = createLinkedList([1, 2, 3, 4, 5]);
    expect(linkedListToList(rotateListBy(head, 0)), equals([1, 2, 3, 4, 5]));
  });

  test('Rotate linked list by 2 rotations', () {
    ListNode<int>? head = createLinkedList([1, 2, 3, 4, 5]);
    expect(linkedListToList(rotateListBy(head, 2)), equals([4, 5, 1, 2, 3]));
  });

  test('Rotate linked list by 5 rotations (same as length)', () {
    ListNode<int>? head = createLinkedList([1, 2, 3, 4, 5]);
    expect(linkedListToList(rotateListBy(head, 5)), equals([1, 2, 3, 4, 5]));
  });

  test('Rotate linked list by 7 rotations (more than length)', () {
    ListNode<int>? head = createLinkedList([1, 2, 3, 4, 5]);
    expect(linkedListToList(rotateListBy(head, 7)), equals([4, 5, 1, 2, 3]));
  });

  test('Rotate linked list of length 1 by any number of rotations', () {
    ListNode<int>? head = createLinkedList([1]);
    expect(linkedListToList(rotateListBy(head, 100)), equals([1]));
  });

  test('Rotate an empty linked list', () {
    ListNode<int>? head = createLinkedList([]);
    expect(linkedListToList(rotateListBy(head, 3)), equals([]));
  });
}
