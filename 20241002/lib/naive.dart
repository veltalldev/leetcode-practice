/// 20241002
/// ### Problem: Determine if a 32-bit Integer is a Power of Four
///
/// I received guidance for this problem; my original ideas involved some manner
/// of enumeration and none of them could beat O(logn) runtime complexity.
///
/// Instead, we use bitwise operations directly on the input to determine its
/// relevant properties.
/// Consider a few powers of 4 to determine a pattern:
/// - 1, 4, 16, or in binary form:
/// - 00001, 00100, 10000
/// Because these are powers of 4, they must also be powers of 2. This implies
/// that they only have one set bit, and that set bit moves left by two places
/// every iteration (x*4 = x * 2 * 2 = x << 2). These two facts form a complete
/// bitwise powers-of-4 test for our input number.

bool isPowerOf4(int num) {
  /// test for existence of solo bit in the MSB position
  /// we flip the bits by subtracting 1 and bitwise intersect them
  /// if `num` is in fact a power of 4, it must have a solo MSB and
  /// the intersection must be 0
  final isSoloMSBMask = (num > 0) && (num & (num - 1) == 0);

  // test for the position of the ONLY set bit. For powers of 4
  // the bit must be in odd positions, so we filter it with
  // the odd-place mask: 0b01010101010101010101010101010101
  final hasBitsInOddPositionsMask = (num & 0x55555555) != 0;

  return isSoloMSBMask && hasBitsInOddPositionsMask;
}
