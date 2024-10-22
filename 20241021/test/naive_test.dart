import 'package:test/test.dart';
import 'package:leetcode20241021/naive.dart';

void main() {
  test('Test Case 1', () {
    expect(minRemovalsToMatchParentheses('()())()'), 1);
  });

  test('Test Case 2', () {
    expect(minRemovalsToMatchParentheses(')(('), 3);
  });

  test('Test Case 3', () {
    expect(minRemovalsToMatchParentheses('((((('), 5);
  });

  test('Test Case 4', () {
    expect(minRemovalsToMatchParentheses(')('), 2);
  });

  test('Test Case 5', () {
    expect(minRemovalsToMatchParentheses(''), 0);
  });

  test('Test Case 6', () {
    expect(minRemovalsToMatchParentheses('()()()'), 0);
  });
}
