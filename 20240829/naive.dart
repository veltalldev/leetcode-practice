import 'dart:math';

/// I have some vague memory about the concept of a powerset
/// A powerset of set X is the union of all of X's subsets, including
/// the empty set and X itself.
///
/// the Powerset P{X} has 2^n members where n is X's size. This is because given
/// the nature that it contains ALL possible subsets, it means each member of
/// X effectively has a choice whether to appear in a subset or not (i.e. all
/// possible combinations).
///
/// One clever way to make use of this idea is to use binary representation.
/// A member of X being included in a particular subset or not can be
/// represented by a single bit of data, and we can permutate this data to
/// create representation for every single possible combination

import 'package:test/test.dart';

void main() {
  group('generateSuperSet', () {
    test('should return power set of an empty set', () {
      var input = <String>{};
      var expectedOutput = {<String>{}};
      expect(generateSuperSet(input), expectedOutput);
    });

    test('should return power set of a single element set', () {
      var input = {'a'};
      var expectedOutput = {
        <String>{},
        {'a'}
      };
      expect(generateSuperSet(input), expectedOutput);
    });

    test('should return power set of a two element set', () {
      var input = {'a', 'b'};
      var expectedOutput = {
        <String>{},
        {'a'},
        {'b'},
        {'a', 'b'}
      };
      expect(generateSuperSet(input), expectedOutput);
    });

    test('should return power set of a three element set', () {
      var input = {'a', 'b', 'c'};
      var expectedOutput = {
        <String>{},
        {'a'},
        {'b'},
        {'c'},
        {'a', 'b'},
        {'a', 'c'},
        {'b', 'c'},
        {'a', 'b', 'c'}
      };
      expect(generateSuperSet(input), expectedOutput);
    });

    test('should return power set of a set with more elements', () {
      var input = {'a', 'b', 'c', 'd'};
      var expectedOutput = {
        <String>{},
        {'a'},
        {'b'},
        {'c'},
        {'d'},
        {'a', 'b'},
        {'a', 'c'},
        {'a', 'd'},
        {'b', 'c'},
        {'b', 'd'},
        {'c', 'd'},
        {'a', 'b', 'c'},
        {'a', 'b', 'd'},
        {'a', 'c', 'd'},
        {'b', 'c', 'd'},
        {'a', 'b', 'c', 'd'}
      };
      expect(generateSuperSet(input), expectedOutput);
    });
  });
}

// =======================================================

Set<Set<T>> generateSuperSet<T>(Set<T> X) {
  final n = X.length;
  final array = X.toList();
  final rows = 1 << n;

  // generate a [2^n subsets x n members] grid, each row of bits
  // represents members of X in that subset
  // e.g. n = 3; [1, 1, 0] means this subset includes the first and second
  // members of the set X but not the third
  final binaryLists = List.generate(rows, (index) {
    return indexToBinaryBits(index, n);
  });

  Set<Set<T>> superSet = {};
  // use the binary data to generate corresponding subsets containing
  // actual set members from X. A positive bit = corresponding member
  // is included
  binaryLists.forEach((binaryList) {
    final Set<T> subset = <T>{};
    for (var i = 0; i < binaryList.length; i++) {
      if (binaryList[i] == 1) subset.add(array[i]);
    }
    superSet.add(subset);
  });

  return superSet;
}

// given an index value, generate an array of bits
// that represents that value in binaryy form
List<int> indexToBinaryBits(int index, int n) {
  final bits = List.filled(n, 0);

  // bit-wise shift the index to get
  // decimal place values
  for (var i = 0; i < n; i++) {
    bits[(n - 1) - i] = (index >> i) & 1;
  }

  return bits;
}
