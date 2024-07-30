// initial idea: split the string into an array of individual words, separated
// by a whitespace.
// Loop through the list and, at every step, "consume" the next word(s) until
// it is no longer possible (said consumption would result in a phrase
// exceeding the character limit)

import 'dart:io';


List<String>? breakString(String s, int k) {
  // building a linked list of words
  MyLinkedNode head = MyLinkedNode().consumeList(s.split(' '));
  
  // lazy fix for test case 7 (oversized input)
  MyLinkedNode current = head;
  if (current.content!.length > k) {
    return null;
  }

  // Loop through the linked list to consume the next words one by one
  while (current.next != null) {
    if (current.content!.length > k) {
      return null;
    }
    if (current.content!.length + current.next!.content!.length + 1 > k) {
      current = current.next!;
    } else {
      current.updateContent("${current.content} ${current.next!.content}");
      current.next = current.next!.next;
    }
  }
  List<String> newlist = [];
  MyLinkedNode cur = head;
  while (true) {
    newlist.add(cur.content!);
    if (cur.next == null) {
      break;
    }
    cur = cur.next!;
  }
  return newlist;
}

class MyLinkedNode {
  MyLinkedNode? next;
  String? content;

  MyLinkedNode({this.content = "", this.next = null});

  void updateContent(String s) {
    content = s;
  }

  void linkTo(MyLinkedNode node) {
    next = node;
  }

  MyLinkedNode consumeList(List<String> list) {
    // consume the list from back to front
    MyLinkedNode current = this;
    current.content = list.removeLast();
    while (!list.isEmpty) {
      current = MyLinkedNode(content: list.removeLast(), next: current);
    }
    return current;
  }

  @override
  String toString() {
    String output = "";
    if (content != null) {
      output += content!;
    }
    return output;
  }

  void printList() {
    MyLinkedNode current = this;
    stdout.write("<$content");
    while (current.next != null) {
      current = current.next!;
      stdout.write(", ${current.content}");
    }
    print(">");
  }

  int getLength() {
    MyLinkedNode current = this;
    int length = 1;
    while (current.next != null) {
      current = current.next!;
      length++;
    }
    return length;
  }

  void printLengths() {
    MyLinkedNode current = this;
    stdout.write("<${content!.length}");
    while (current.next != null) {
      current = current.next!;
      stdout.write(", ${current.content!.length}");
    }
    print(">");
  }
}

//
// ─── LINKEDNODE TEST CASES ──────────────────────────────────────────────────────
//

// void main() {
//   // Test case 1: Default constructor
//   MyLinkedNode node1 = MyLinkedNode();
//   assert(node1.content == "", "Test Case 1 Failed: Default content should be an empty string.");
//   assert(node1.next == null, "Test Case 1 Failed: Default next node should be null.");

//   // Test case 2: Updating content
//   node1.updateContent("Node 1");
//   assert(node1.content == "Node 1", "Test Case 2 Failed: Content should be 'Node 1'.");

//   // Test case 3: Linking nodes
//   MyLinkedNode node2 = MyLinkedNode();
//   node1.linkTo(node2);
//   assert(node1.next == node2, "Test Case 3 Failed: node1 should link to node2.");

//   // Test case 4: Chain of nodes
//   MyLinkedNode node3 = MyLinkedNode();
//   node2.linkTo(node3);
//   assert(node1.next == node2 && node2.next == node3, "Test Case 4 Failed: Chain of nodes is incorrect.");

//   // Test case 5: toString method with non-null content
//   node3.updateContent("Node 3");
//   assert(node3.toString() == "Node 3", "Test Case 5 Failed: toString() should return 'Node 3'.");

//   // Test case 6: toString method with null content
//   MyLinkedNode node4 = MyLinkedNode();
//   node4.content = null;
//   assert(node4.toString() == "", "Test Case 6 Failed: toString() should return an empty string for null content.");

//   // Test case 7: toString method with empty content
//   MyLinkedNode node5 = MyLinkedNode();
//   node5.content = "";
//   assert(node5.toString() == "", "Test Case 7 Failed: toString() should return an empty string for empty content.");

//   print("All test cases passed!");
// }

//
// ─── GPT TEST CASES ─────────────────────────────────────────────────────────────
//
void main() {
  // Test cases
  List<String>? result;

  // Helper function to print test results
  void printTestResult(String description, String s, int k, List<String>? result,
      List<String>? expected) {
    print(
        '$description\nParameters: (s: "$s", k: $k)\nActual:   $result\nExpected: $expected\n');
  }

  // Test Case 1: Example given in the problem statement
  result = breakString("the quick brown fox jumps over the lazy dog", 10);
  printTestResult("Test Case 1", "the quick brown fox jumps over the lazy dog", 10,
      result, ["the quick", "brown fox", "jumps over", "the lazy", "dog"]);

  // Test Case 2: Exact fit in a single line
  result = breakString("the quick brown fox", 19);
  printTestResult(
      "Test Case 2", "the quick brown fox", 19, result, ["the quick brown fox"]);

  // Test Case 3: Words exactly fitting into lines of length k
  result = breakString("a b c d e f g h i j", 3);
  printTestResult("Test Case 3", "a b c d e f g h i j", 3, result,
      ["a b", "c d", "e f", "g h", "i j"]);

  // Test Case 4: Single long word that fits into k
  result = breakString("supercalifragilisticexpialidocious", 34);
  printTestResult("Test Case 4", "supercalifragilisticexpialidocious", 34, result,
      ["supercalifragilisticexpialidocious"]);

  // Test Case 5: Single long word that exceeds k
  result = breakString("onewordisverylong", 5);
  printTestResult("Test Case 5", "onewordisverylong", 5, result, null);

  // Test Case 6: Empty string
  result = breakString("", 5);
  printTestResult("Test Case 6", "", 5, result, []);

  // Test Case 7: String with multiple spaces and minimal k value
  result = breakString("a b c d e f g h i j", 1);
  printTestResult("Test Case 7", "a b c d e f g h i j", 1, result,
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]);
}
