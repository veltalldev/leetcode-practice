void prefixBrickSums(List<int> brickRow, Map<int, int> prefixSumFreq) {
  int runningSum = 0;
  for (var brickSize in brickRow) {
    runningSum += brickSize;
    if (prefixSumFreq.containsKey(runningSum)) {
      prefixSumFreq[runningSum] = prefixSumFreq[runningSum]! + 1;
    } else {
      prefixSumFreq[runningSum] = 1;
    }
  }
  // Remove the last sum since it represents the right edge of the wall
  prefixSumFreq.remove(runningSum);
}

int fewestBricksCut(List<List<int>> wall) {
  if (wall.isEmpty) return 0;

  // Create a map to store the frequency of prefix sums (potential cut positions)
  final Map<int, int> prefixSumFreq = {};

  // Populate the frequency map for all rows
  for (var row in wall) {
    prefixBrickSums(row, prefixSumFreq);
  }

  // Find the prefix sum with the maximum frequency (the best cut position)
  int maxAlignedEdges = prefixSumFreq.values
      .fold(0, (maxEdges, current) => current > maxEdges ? current : maxEdges);

  // The minimum number of bricks cut is the total rows minus the best cut alignment
  return wall.length - maxAlignedEdges;
}
