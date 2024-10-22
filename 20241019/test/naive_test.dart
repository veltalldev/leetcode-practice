import 'package:test/test.dart';
import 'package:leetcode20241019/naive.dart';

void main() {
  test('Network propagation test 1', () {
    expect(
        networkPropagationTime(5, [
          [0, 1, 5],
          [0, 2, 3],
          [0, 5, 4],
          [1, 3, 8],
          [2, 3, 1],
          [3, 5, 10],
          [3, 4, 5]
        ]),
        equals(9));
  });

  test('Network propagation test 2', () {
    expect(
        networkPropagationTime(3, [
          [0, 1, 2],
          [0, 2, 4],
          [1, 2, 1],
          [1, 3, 7],
          [2, 3, 3]
        ]),
        equals(6));
  });

  test('Network propagation test 3', () {
    expect(
        networkPropagationTime(2, [
          [0, 1, 1],
          [1, 2, 2]
        ]),
        equals(3));
  });
}
