import 'package:test/test.dart';
import 'package:leetcode20241018/naive.dart';

void main() {
  test('Spiral order test 1', () {
    expect(
        spiralOrder([
          [1, 2, 3, 4, 5],
          [6, 7, 8, 9, 10],
          [11, 12, 13, 14, 15],
          [16, 17, 18, 19, 20]
        ]),
        equals([
          1,
          2,
          3,
          4,
          5,
          10,
          15,
          20,
          19,
          18,
          17,
          16,
          11,
          6,
          7,
          8,
          9,
          14,
          13,
          12
        ]));
  });

  test('Spiral order test 2', () {
    expect(
        spiralOrder([
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ]),
        equals([1, 2, 3, 6, 9, 8, 7, 4, 5]));
  });

  test('Spiral order test 3', () {
    expect(
        spiralOrder([
          [1]
        ]),
        equals([1]));
  });

  test('Spiral order test 4', () {
    expect(
        spiralOrder([
          [1, 2],
          [3, 4]
        ]),
        equals([1, 2, 4, 3]));
  });
}
