/// 20241022
/// First I would like to complain about the fact that this problem
/// is extremely poorly defined. I will list my assumptions below
/// and proceed with a solution that addresses them
///   - A valid configuration of pieces that fill up the 
///     rectangular space only concerns itself with
///     the choice of the pieces
///   - All pieces of the same type are indistinguishable
///   - All orientations and positionings of the pieces and
///     combinations of pieces only produce 1 config.
///   - At least one tromino and one domino must be present

// n is the length of the nx2 space that
// needs to be filled using domino and tromino pieces
int waysToCoverBoardWithPieces(int n) {
  // since we're only concerning ourselves with the 
  // COUNTs of dominoes and trominoes, this effectively
  // means that the count of trominoes is the count
  // of the configs, because the dominoes would just
  // fill in the rest of the space without creating any
  // variety god I'm writing so much comment this problem
  // is so dumb
  return (2n % 6 == 0) ? (2n % 6) - 1 : (2n % 6);
} 
