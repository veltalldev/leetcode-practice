/// 20241023
/// this problem took some time to figure out, I'll outline the logic below
/// 1. A "next" number needs to be numerically larger than the input
/// 2. To produce a bigger number, at least the digit-place needs to become
///    larger. But we cannot arbitrarily change numbers, we can only swap them
/// 3. A swap cannot result in any numbers to the left becoming smaller
/// 4. Therefore a swap is only possible if it creates an out-of-sorted-order
///    pair (where the left side is bigger) that wasn't there before
/// 5. If we scan from the end (right side), the first in-sorted-order pair
///    indicates the location where such a number can be swapped. And since that
///    number (at index i) needs to grow, we swap it with the max among the
///    remaining numbers on the right.
/// 6. Then we need to sort the rest of the numbers to produce the smallest config

String nextLexicographicalPermutation(int n) {
  final digits = n.toString().split("").map((s) => int.parse(s)).toList();

  var swapIndex = digits.length - 2; // need at least 2 numbers to need swap
  while (true && swapIndex > 0) {
    if (digits[swapIndex] < digits[swapIndex + 1]) {
      // found sorted order, swap target acquired
      break;
    } else {
      swapIndex--;
    }
  }
  // should have acquired swapIndex
  // now we look for the min value to swap with
  var minValue = 1e9.toInt();
  var searchIndex = swapIndex;
  while (searchIndex < digits.length) {
    if (digits[swapIndex] > digits[searchIndex]) {
      // these numbers are smaller, cannot swap with, ignore
      continue;
    } else {
      // found a potential swap target
      if (minValue > digits[searchIndex]) {
        // update tracker
        minValue = digits[searchIndex];
      }
    }
    searchIndex++;
  }
  // minValue should now hold the smallest number bigger than swap
  final minIndex = digits.indexOf(minValue);

  // perform swap
  final temp = digits[swapIndex];
  digits[swapIndex] = digits[minIndex];
  digits[minIndex] = temp;

  // sort the rest to find smallest value
  final sublist = digits.sublist(swapIndex + 1);
  sublist.sort();
  digits.replaceRange(swapIndex + 1, digits.length, sublist);

  return digits.join("");
}

