/// 20240925
/// ### Problem: Minimum Brick Cuts in a Wall
///
/// There are two ways I could think of to approach this problem
/// - the initial solution is to check every cut and keep track of them
///   in a set. Because already-explored cuts are not re-explored, any
///   future rows of brick can only produce NEW cuts, i.e. cuts that
///   WILL go through bricks above that row. So if the current row i
///   is equal to or greater than the smallest cut found so far, there
///   is no further need to continue the search.
///
/// - the other approach works backwards by assigning a score for each
///   cut by counting the edges that align with that cut. The cut with the
///   highest score goes through the most edges and thus cuts through the
///   fewest bricks.

void prefixBrickSums(List<int> brickRow, Map<int, int> prefixSumFreq) {
  var runningSum = 0;
  brickRow.forEach((brickSize) {
    runningSum += brickSize;
    if (prefixSumFreq.containsKey(runningSum)) {
      prefixSumFreq[runningSum] = prefixSumFreq[runningSum]! + 1;
    } else {
      prefixSumFreq[runningSum] = 1;
    }
  });
  // remove the last "cut" because it "cuts" the right edge of the wall
  prefixSumFreq.remove(runningSum);
}

int fewestBricksCut(List<List<int>> wall) {
  final cutFreqMap = <int, int>{};
  wall.forEach((row) {
    prefixBrickSums(row, cutFreqMap);
  });
  final sortedList = cutFreqMap.entries.toList();
  sortedList.sort((a, b) => b.value.compareTo(a.value));
  final correctCut = sortedList[0].key;
  var brickCount = 0;
  wall.forEach((row) {
    var runningSum = 0;
    bool goodCut = false;
    row.forEach((brick) {
      runningSum += brick;
      if (runningSum == correctCut) {
        goodCut = true;
      }
    });
    if (!goodCut) {
      brickCount++;
    }
  });
  return brickCount;
}
