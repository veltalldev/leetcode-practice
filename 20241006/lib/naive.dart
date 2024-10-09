/// 20241006
/// First, definition: rotating to the right means the element at index `i`
/// will move to index `i+k`, any node that reaches the tail will become the
/// new head on the next rotation.
///
/// Effectively, we need to rotate by `k%n` positions where `n` is the length
/// of the list.
///
/// Rotating by `k` positions means the last `k` nodes will rotate to the
/// front, maintaining their original links. The `n-k` node will become
/// the new tail

ListNode<dynamic>? rotateListBy(ListNode<dynamic>? head, int rotations) {
  if (head == null) return null;
  if (head.next == null) return head;
  ListNode front = head;
  ListNode tail = head;

  // preprocessing
  int length = 1;
  while (tail.next != null) {
    tail = tail.next!;
    length++;
  }
  int k = rotations % length;
  if (k == 0) return head;
  for (var i = 1; i < length - k; i++) {
    front = front.next!;
  }

  // front and back now mark the segment that need to rotate to the front
  tail.next = head;
  head = front.next;
  front.next = null;

  return head;
}

class ListNode<T> {
  T value;
  ListNode<T>? next;

  ListNode(this.value, [this.next]);
}
