// initial idea: split the string into an array of individual words, separated
// by a whitespace.
// Loop through the list and, at every step, "consume" the next word(s) until
// it is no longer possible (said consumption would result in a phrase
// exceeding the character limit)

import 'dart:collection';

List<String>? breakString(String s, int k) {
    List<Word> words = s.split(' ').map((w) => new Word(w)).toList();
    LinkedList<Word> linkedwords = new LinkedList<Word>()..addAll(words);
    for (var lword in linkedwords) {
        if (lword.next == null) {
          break;
        }
        if(lword.content.length + lword.next!.content.length + 1 > k) {
          break;
        }
        // combine words
        Word newWord = new Word(lword.content + " " + lword.next!.content);
        // replace
        lword.insertBefore(newWord);
        lword.next!.unlink(); lword.unlink();
    }
    return linkedwords.map((word) => word.content).toList();
}

final class Word extends LinkedListEntry<Word> {
    final String content;

    Word(this.content);

    @override
    String toString() {
        return content;
    }
}

//
// ─── GPT TEST CASES ─────────────────────────────────────────────────────────────
//
void main() {
    // Test cases
    List<String>? result;

    // Test Case 1: Example given in the problem statement
    result = breakString("the quick brown fox jumps over the lazy dog", 10);
    print(result); // Expected: ["the quick", "brown fox", "jumps over", "the lazy", "dog"]

    // Test Case 2: Exact fit in a single line
    result = breakString("the quick brown fox", 15);
    print(result); // Expected: ["the quick brown fox"]

    // Test Case 3: Words exactly fitting into lines of length k
    result = breakString("a b c d e f g h i j", 3);
    print(result); // Expected: ["a b", "c d", "e f", "g h", "i j"]

    // Test Case 4: Single long word that fits into k
    result = breakString("supercalifragilisticexpialidocious", 34);
    print(result); // Expected: ["supercalifragilisticexpialidocious"]

    // Test Case 5: Single long word that exceeds k
    result = breakString("onewordisverylong", 5);
    print(result); // Expected: null

    // Test Case 6: Empty string
    result = breakString("", 5);
    print(result); // Expected: []

    // Test Case 7: String with multiple spaces and minimal k value
    result = breakString("a b c d e f g h i j", 1);
    print(result); // Expected: null
}
