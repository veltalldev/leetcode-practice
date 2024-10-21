import 'package:leetcode20241017/naive.dart';
import 'package:test/test.dart'; // testing git credential persistence

void main() {
  group('minMovesToUnlock Tests', () {
    // Simple case: Start and target are the same
    test('Same start and target', () {
      expect(minMovesToUnlock([0, 0, 0], {}), 0);
    });

    // Simple case: One move needed
    test('One move to target', () {
      expect(minMovesToUnlock([0, 0, 1], {}), 1);
    });

    // Case with dead end blocking a path
    test('Dead end blocking one possible path', () {
      expect(minMovesToUnlock([0, 0, 8], {"009"}),
          4); // Path should be 000 -> 010 -> 019 -> 018 -> 008
    });

    // Simple case: Two moves to reach target
    test('Two moves to target', () {
      expect(minMovesToUnlock([0, 0, 2], {}), 2);
    });

    // Complex case with dead ends and bypassing
    test('Bypass dead end with multiple digit changes', () {
      expect(minMovesToUnlock([0, 0, 8], {"009", "010"}),
          4); // Path: 000 -> 100 -> 109 -> 108 -> 008
    });

    // Edge case: Locked target and dead ends make it impossible
    test('Target unreachable due to dead ends', () {
      expect(
          minMovesToUnlock([
            0,
            0,
            8
          ], {
            "000",
            "009",
            "001",
            "002",
            "003",
            "004",
            "005",
            "006",
            "007",
            "008"
          }),
          null);
    });

    // Edge case: Cycling through digits
    test('Target is a DeadEnd', () {
      expect(minMovesToUnlock([9, 9, 9], {"999"}),
          null); // 000 -> 100 -> 200 -> 999
    });

    // Case with a long sequence of moves
    test('Long sequence to target without dead ends', () {
      expect(minMovesToUnlock([9, 9, 9], {}), 3); // 000 -> 900 -> 990 -> 999
    });

    // Complex case with two non-zero digits
    test('Target with two non-zero digits', () {
      expect(minMovesToUnlock([0, 1, 8], {"009", "019"}),
          5); // Path: 000 -> 010 -> 020 -> 029 -> 028 -> 018
    });
  });
}
