/// 20240908
/// A naive brute force solution is to simply remove each combination of
/// intervals and check for overlap

import 'dart:math';

import 'helper.dart';

// generate every combination of the input intervals in reversed order
// - a positive bit represents the inclusion of that interval during
// the check for overlap
List<List<bool>> generateCombinations(List<(int, int)> intervals) {
  final n = intervals.length;
  return List.generate(
    pow(2, n).toInt(),
    (index) => indexToBinary(index),
  );
}

// given an index from 0 to 2^n, convert it into the binary representation
// in the form of a list of booleans
List<bool> indexToBinary(int index) {
  if (index == 0) return [false];
  final binList = <bool>[];
  while (index > 0) {
    binList.add(index % 2 == 1 ? true : false); // extract the LSB
    index >> 1; // remove the bit by right-shifting once
  }
  return binList.reversed.toList();
}

int minOverlapRemovals(List<(int, int)> intervals) {
  final combiMatrix = generateCombinations(intervals);
  final removals = <(int, int)>[];
  // mirror the binary representation into the actual
  // subset of intervals
  combiMatrix.forEach((combi) {
    final intervalCombination = <(int, int)>[];
    for (var i = 0; i < combi.length; i++) {
      if (combi[i] == true) {
        intervalCombination.add(intervals[i]);
      }
    }
    if (hasOverlap(intervalCombination) == false) {
      // found the first combination that has no overlap
      for (var i = 0; i < combi.length; i++) {
        if (combi[i] == false) {
          removals.add(intervals[i]);
        }
      }
    }
  });
  return removals.length;
}
