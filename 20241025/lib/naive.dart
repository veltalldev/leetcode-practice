/// 20241025
/// This problem has a simple solution using the mathematical knowledge
/// of generating binomial coefficients,
/// i.e. row k = [(k-1)C0, (k=1)C1, ... , (k-1)C(k-1)]
/// and we can derive the next combination term from the previous easily
/// with: (k-1)C(r+1) = (k-1)Cr * (k-1-r)/(r+1)
///
/// However, I avoided this straightforward path to turn it into
/// more of a programming challenge. This approach builds the
/// rows of the triangles one by one incrementally, utilizing
/// the symmetry of the row to split it in half:
/// - the left side serves as source information
/// - the right side gets manipulated to become the next row
/// - then the left side's information gets overwritten by mirroring the
///   right side for a complete new row.

/*Loop i=3 to i=k, for each:
Fill nums[0] = 1 and nums[i-1] = 1
Loop j=i-2 to j=i~/2, for each
Update nums[j] = nums[i-j-2] + nums[i-j-1]
Loop a=1 to a=i~/2, for each

Split condition: if i is odd, update logic is
nums[i~/2 - a] = nums[i~/2 + a]

If i is even:
nums[i~/2 - a] = nums[i~/2 + a - 1]*/

List<int> getPascalRow(int kZeroIndexed) {
  if (kZeroIndexed < 0) throw ArgumentError();
  final k = kZeroIndexed + 1;
  if (k == 1) return [1];
  if (k == 2) return [1, 1];

  final nums = List.filled(k, 0);
  nums.fillRange(0, 2, 1);

  /// initialize to [1 1] for base case
  for (var row = 3; row <= k; row++) {
    // initialize
    nums[0] = 1;
    nums[row - 1] = 1;
    final center = row ~/ 2;
    // update the right half using sums of values on the
    // left half
    for (var i = row - 2; i >= center; i--) {
      nums[i] = nums[row - i - 2] + nums[row - i - 1];
    }
    // mirror the values on the right to the left
    for (var a = 1; a <= center; a++) {
      int rightIndex = center + a;
      if (row % 2 == 0) rightIndex -= 1;
      // update values
      nums[center - a] = nums[rightIndex];
    }
  }
  return nums;
}

// alternative method using mathematical formulation
List<int> getPascalRowDirect(int k) {
  if (k < 0) throw ArgumentError();
  // k is already 0-indexed
  var initTerm = 1; // kC0
  final row = <int>[initTerm];
  for (var r = 1; r <= k; r++) {
    // calculate kCr
    initTerm = initTerm * (k - r + 1) * (r); // recursive relationship
    row.add(initTerm);
  }
  return row;
}
