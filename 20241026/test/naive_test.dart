import 'package:test/test.dart';
import 'package:leetcode20241026/naive.dart';

void main() {
  group('Finds the smallest sparse number >= N', () {
    test('Input is already sparse', () {
      final sparseNumbers = [0, 1, 2, 4, 5, 8, 9];
      final nextSparseNumbers =
          sparseNumbers.map((e) => findNextSparseNumber(e)).toList();
      expect(nextSparseNumbers, orderedEquals(sparseNumbers));
    });

    test('Some small non-sparse numbers', () {
      final nonsparseNumbers = [3, 6, 7];
      final nextSparseNumbers =
          nonsparseNumbers.map((e) => findNextSparseNumber(e)).toList();
      expect(nextSparseNumbers, orderedEquals([4, 8, 8]));
    });

    test('More complex cases with multiple blocks of 1s', () {
      final nonsparseNumbers = [12029, 11997, 8439];
      final nextSparseNumbers =
          nonsparseNumbers.map((e) => findNextSparseNumber(e)).toList();
      expect(nextSparseNumbers, orderedEquals([16385, 16385, 8448]));
    });
  });

  group("Scans for blocks of set bits", () {
    test("Some unorganized tests for now", () {
      final bitList1 = [1, 0, 0, 1, 1, 1, 0]; // should return (3, 6)
      final bitList2 = [1, 1, 1, 0, 0, 0, 0]; // should return (0, 3)
      final bitList3 = [1, 1, 1, 1, 1, 1, 1]; // should return (0, 7)
      final block1 = findNextBlockOfSetBits(bitList1, bitList1.length - 1);
      final block2 = findNextBlockOfSetBits(bitList2, bitList2.length - 1);
      final block3 = findNextBlockOfSetBits(bitList3, bitList3.length - 1);

      expect(block1, equals((true, 3, 6)));
      expect(block2, equals((true, 0, 3)));
      expect(block3, equals((true, 0, 7)));
    });
    test("Unsuccessful search", () {
      final bitList4 = [1, 0, 0, 0, 0, 0, 0]; // should return (-1, -1)
      final block4 = findNextBlockOfSetBits(bitList4, bitList4.length - 1);
      expect(block4, equals((false, -1, -1)));
    });
    test("Searches with a custom start index", () {
      final bitList5 = [1, 1, 0, 1, 1, 1, 1]; // should return (3, 7)
      final block5 = findNextBlockOfSetBits(bitList5, bitList5.length - 1);
      expect(block5, equals((true, 3, 7)));
    });
    test("Multiple blocks exist, should search for rightmost block", () {
      final bitList6 = [1, 1, 0, 1, 1, 1, 1];
      final block6 = findNextBlockOfSetBits(bitList6, 2);
      expect(block6, equals((true, 0, 2)));
    });
  });

  group('Converts integers to their binary representations', () {
    test('Edge case 1', () {
      final integerValue = 0;
      final binaryRepresentation = [0];
      final binList = intToBinary(integerValue);
      expect(binList, orderedEquals(binaryRepresentation));
    });
    test('Simple conversion test', () {
      final integerValue = 7;
      final binaryRepresentation = [1, 1, 1];
      final binList = intToBinary(integerValue);
      expect(binList, orderedEquals(binaryRepresentation));
    });

    test('Simple conversion test', () {
      final integerValue = 16;
      final binaryRepresentation = [1, 0, 0, 0, 0];
      final binList = intToBinary(integerValue);
      expect(binList, orderedEquals(binaryRepresentation));
    });

    test('Simple conversion test', () {
      final integerValue = 69;
      final binaryRepresentation = [1, 0, 0, 0, 1, 0, 1];
      final binList = intToBinary(integerValue);
      expect(binList, orderedEquals(binaryRepresentation));
    });
  });

  group('Converts binary forms to their integer representations', () {
    test('Edge case 1', () {
      final integerValue = 0;
      final binaryRepresentation = [0];
      final intValue = binaryToInt(binaryRepresentation);
      expect(intValue, equals(integerValue));
    });
    test('Simple conversion test', () {
      final integerValue = 7;
      final binaryRepresentation = [1, 1, 1];
      final intValue = binaryToInt(binaryRepresentation);
      expect(intValue, equals(integerValue));
    });

    test('Simple conversion test', () {
      final integerValue = 16;
      final binaryRepresentation = [1, 0, 0, 0, 0];
      final intValue = binaryToInt(binaryRepresentation);
      expect(intValue, equals(integerValue));
    });

    test('Simple conversion test', () {
      final integerValue = 69;
      final binaryRepresentation = [1, 0, 0, 0, 1, 0, 1];
      final intValue = binaryToInt(binaryRepresentation);
      expect(intValue, equals(integerValue));
    });
  });
}
