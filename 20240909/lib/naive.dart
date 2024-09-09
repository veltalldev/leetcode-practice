/// 20240909
/// Sum3 to K
/// It seems rather obvious that we should leverage a similar problem
/// where we had to determine whether TWO numbers in a list can sum to K

// ===================================================
// Helper function from an old project
bool hasPairWithSum(List<int> list, int k) {
  var sumToKResult = false;
  for (var i = 0; i < list.length; i++) {
    for (var j = i + 1; j < list.length; j++) {
      if (list[i] + list[j] == k) {
        sumToKResult = true;
        break;
      }
    }
  }
  return sumToKResult;
}

// ====================================================
// ====================================================
// ====================================================
bool hasTripletWithSum(List<int> list, int k) {
  var sumToKResult = false;
  for (var i = 0; i < list.length; i++) {
    final listWithoutI = [...list.sublist(0, i), ...list.sublist(i + 1)];
    sumToKResult = hasPairWithSum(listWithoutI, k - list[i]);
    if (sumToKResult == true) {
      break;
    }
  }
  return sumToKResult;
}
