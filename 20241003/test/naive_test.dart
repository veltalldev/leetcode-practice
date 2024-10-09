import 'package:test/test.dart';
import 'package:leetcode20241003/naive.dart';

void main() {
  test('Already sorted array', () {
    expect(smallestSortWindow([1, 2, 3, 4, 5]), equals((-1, -1)));
  });

  test('Entire array out of order', () {
    expect(smallestSortWindow([5, 4, 3, 2, 1]), equals((0, 4)));
  });

  test('Small window in the middle', () {
    expect(smallestSortWindow([1, 3, 7, 5, 6, 9]), equals((2, 4)));
  });

  test('Disorder at the start', () {
    expect(smallestSortWindow([5, 3, 4, 8, 10]), equals((0, 2)));
  });

  test('Disorder at the end', () {
    expect(smallestSortWindow([1, 2, 8, 6, 5]), equals((2, 4)));
  });

  test('Single element array', () {
    expect(smallestSortWindow([1]), equals((-1, -1)));
  });

  test('No window needed, but minor change at the end', () {
    expect(smallestSortWindow([1, 2, 3, 5, 4]), equals((3, 4)));
  });
}
