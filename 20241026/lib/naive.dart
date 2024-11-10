import 'dart:math';

/// 20241026

int findNextSparseNumber(int n) {
  // convert to binary form to enable manipulation of bits
  final bitList = intToBinary(n);

  // Loops from the tail to the front to search for blocks of 1s
  // Example: 1011101 would return (2, 5) to facilitate [List.replaceRange]
  var lastIndex = bitList.length - 1;
  while (true) {
    var (found, left, right) = findNextBlockOfSetBits(bitList, lastIndex);
    if (!found) break;
    if (right - left == 1) {
      lastIndex = left - 1; // set bit is not modified, has to step over
      continue;
    }
    // replaces [left, right) segment with 0s
    bitList.replaceRange(left, right, List.filled(right - left, 0));

    // Overflow carry bit to create bigger number
    if (left > 0) {
      bitList[left - 1] = 1;
    } else {
      bitList.insert(0, 1);
    }

    lastIndex = left; // update loop to continue processing
  }

  // convert back to integer form for answer
  return binaryToInt(bitList);
}

/// Scans in reverse for values of interest, then backtracks one step
/// and marks positions for report
(bool, int, int) findNextBlockOfSetBits(List<int> bitList, int lastIndex) {
  var found = true;
  var currentIndex = lastIndex;
  var left = -1;
  var right = -1;
  while (currentIndex >= 0 && bitList[currentIndex] != 1) {
    currentIndex--;
  }
  if (currentIndex <= 0) {
    return (!found, left, right);
  }
  right = currentIndex + 1; // found a valid right bound
  while (currentIndex >= 0 && bitList[currentIndex] != 0) {
    currentIndex--;
  }
  left = currentIndex + 1; // found a valid left bound
  return (found, left, right);
}

/// Converts a non-negative integer to its binary representation.
List<int> intToBinary(int n) {
  if (n == 0) return [0];
  final bitList = <int>[];
  while (n > 0) {
    bitList.add((1 & n));
    n >>= 1;
  }
  return bitList.reversed.toList();
}

/// Converts a binary representation to its integer form.
int binaryToInt(List<int> bitList) {
  var rollingSum = 0.0;
  for (var i = 0; i < bitList.length; i++) {
    final binaryPlace = bitList.length - 1 - i;
    rollingSum += bitList[i] * pow(2, binaryPlace);
  }
  return rollingSum.toInt();
}
