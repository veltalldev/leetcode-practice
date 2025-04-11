/// 20250310
/// Given an array containing n distinct numbers taken from 0, 1, 2, ..., n,
/// find the one number in the range that is missing from the array.
///
/// Example:
/// Input: [3,0,1]
/// Output: 2
/// Input: [9,6,4,2,3,5,7,0,1]
/// Output: 8
///
/// Start: 10:25pm
///
/// Exploration:
/// since the values are specified to be:
/// * 0-indexed
/// * unique
/// * has no gaps
/// * starts from minimum
/// There seems to be a correlation between the size of the array and the values it can contain. For example, if the array has size 10, we know the values must be: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 in a normal case. Only one of these is allowed to be missing, reducing the array length to n-1 or 9.
///
/// Which means, given an input array of size N, we expect a continuous sequence of numbers from 0 to N-1 with no gaps except for the missing number we have to identify.
/// One immediate thought to make use of this structure is to use one of its known aggregate behavior: the gaussian sum: s(arr) = 1/2 \* (0+n)*(n+1)
/// To verify my memory of the formula: 1 + 2 + 3 + 4 + ... + 10 = 11 \* 5 = 55 = 1/2 (1+10) \* (10) = (1/2) \* (first + last) \* (number of values)
///
/// sanity check:
/// N = 3
/// 1-indexed sequence: 1 2 3
/// 0-indexed sequence: 0 1 2
/// 1-indexed G(N) = 1/2 (1+3) (3)
/// 0-indexed G(N) = 1/2 (0+2) (3)
///
/// So let's take a step back to be clear about how we'll use this relationship:
/// If the array were to have length N with no missing numbers, we expect the gaussian sum to be G(N) = 1/2 \* (0 + N-1) \* (N) because it's 0-indexed
/// If the array were to have length N with ONE missing number, then the original full list had length N+1
/// Therefore the original gaussian sum is G(N+1) = 1/2 \* (0 + N) (N+1)
/// But because the array of length N is missing one number, it is exactly that much short of G(N+1).
///
/// Therefore G(N+1) - sum(arr) = missing number

int gaussianSum(int first, int last, int count) {
  return (first + last) * (count) ~/ 2;
}

int findMissingNumberInSeq(List<int> list) {
  int realSum = list.isNotEmpty ? list.reduce((a, b) => a + b) : 0;
  int gSum = gaussianSum(0, list.length, list.length + 1);
  return gSum - realSum;
}

void main(List<String> args) {
  // a few tests
  final ans1 = 2;
  final ans2 = 8;
  final list1 = List.generate(3, (i) => i)..remove(ans1);
  final list2 = List.generate(9, (i) => i)..remove(ans2);
  ;
  assert(findMissingNumberInSeq(list1) == ans1);
  assert(findMissingNumberInSeq(list2) == ans2);

  final ans3 = 12;
  final ans4 = 4;
  final ans5 = 6;
  final list3 = List.generate(15, (i) => i)..remove(12);
  final list4 = List.generate(15, (i) => i)..remove(4);
  final list5 = List.generate(7, (i) => i)..remove(6);
  assert(findMissingNumberInSeq(list3) == ans3);
  assert(findMissingNumberInSeq(list4) == ans4);
  assert(findMissingNumberInSeq(list5) == ans5);

  final emptyList = <int>[];
  final emptyAns = 0;
  assert(findMissingNumberInSeq(emptyList) == emptyAns);

  print("All tests passed");
}
 
/// First finished pass: 10:49pm
/// 
/// I think I won't fix the implementation for the following reason:
/// * The gaussian sum by its nature does not specify what the starting value is, or even the step size between each value: the formula is strictly (`first` + `last`) \* `count/2`. So I prefer to specify those parameters to keep it true to its mathematical spirit instead of hardcoding it to fit the 0-indexed size 1 formula
/// * I just have to modify my use of the formula to fit the situation I find myself in: for an input list of size N, the original complete gaussian list is size N+1, so count = N+1, minimum = 0 and maximum = N
/// 
/// 
/// ```
/// int gaussianSum(int first, int last, int count) {
///   return (first + last) * (count) ~/ 2;
/// }
/// 
/// int findMissingNumberInSeq(List<int> list) {
///   int realSum = list.reduce((a, b) => a + b);
///   int gSum = gaussianSum(0, list.length, list.length + 1);
///   return gSum - realSum;
/// }
/// ```
/// 
/// Thus the following argument/parameter set authentically honors the sum in its mathematical formulation
/// Finished deliberation by 10:55pm