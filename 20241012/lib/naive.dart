/// 20241012
///
/// There are several important observations:
///   1.  it's a "continuous" sequence of integers, a_n = n
///   2.  when choosing a valid candidate, choosing a big enough value
///       will leave little room at the top to fit more +'s if they are found
///   ==> naturally, this implies that the best approach locally is to
///       choose the smallest number that satisfies the condition
///   ==> this implies further that we should choose the number closest to
///       the current number that satisfies the condition, no matter
///       which side we're looking at.
///   3.  if there is only one `None` condition at the beginning, then there
///       are exactly ENOUGH plusses (set P) and minuses (set M) to fill
///       the sequence, i.e. size(P + M) = N-1
///   4.  this leads to the conclusion that we can accurately partition the
///       number line into 3 parts [0..m], [m..p], and [p..N]
///       where [0..m] are values we're allowed to pick for instances of `-`
///             [p..N] are values we're allowed to pick for instances of `+`
///         and [m..p] are values we're allowed to pick for instances of `None`
///   5.  this formulation also solves the extra situation where the problem
///       allows for the appearance of multiple instances of `None`. We just
///       pick anything in the appropriate range
///   6.

List<int> reconstructSequence(List<String> comparisonArray) {
  var countPlus = 0;
  var countMinus = 0;
  var countNone = 0;
  for (var symbol in comparisonArray) {
    switch (symbol) {
      case "+":
        countPlus++;
        break;
      case "-":
        countMinus++;
      case "None":
        countNone++;
      default:
        throw Exception("invalid comparison condition $symbol");
    }
  }

  final minusList = List.generate(countMinus, (index) => index);
  final noneList = List.generate(countNone, (index) => countMinus + index);
  final plusList =
      List.generate(countPlus, (index) => countMinus + countNone + index);

  return comparisonArray.map((comparisonSymbol) {
    var numberChoice = -1;
    switch (comparisonSymbol) {
      case "+":
        numberChoice = plusList.removeAt(0); // smallest item from the right
        break;
      case "-":
        numberChoice = minusList.removeLast(); // biggest item from the left
      default:
        numberChoice = noneList.removeLast(); // any value will do
    }
    return numberChoice;
  }).toList();
}
