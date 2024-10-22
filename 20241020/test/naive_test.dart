import 'package:test/test.dart';
import 'package:leetcode20241020/naive.dart';

void main() {
  test('Test Case 1', () {
    var exchangeRates = [
      [1.0, 0.5, 2.0],
      [2.0, 1.0, 4.0],
      [0.5, 0.25, 1.0]
    ];
    expect(hasArbitrage(exchangeRates), false);
  });

  test('Test Case 2', () {
    var exchangeRates = [
      [1.0, 1.1, 0.9],
      [0.9, 1.0, 1.2],
      [1.1, 0.8, 1.0]
    ];
    expect(hasArbitrage(exchangeRates), true);
  });

  test('Test Case 3', () {
    var exchangeRates = [
      [1.0, 0.9, 1.2],
      [1.1, 1.0, 0.8],
      [0.85, 1.25, 1.0]
    ];
    expect(hasArbitrage(exchangeRates), true);
  });

  test('Test Case 4', () {
    var exchangeRates = [
      [1.0, 2.0, 3.0],
      [0.5, 1.0, 1.5],
      [0.33, 0.67, 1.0]
    ];
    expect(hasArbitrage(exchangeRates), false);
  });
  test('Test Case 5 - No Arbitrage, Rates Close to 1', () {
    var exchangeRates = [
      [1.0, 1.001, 0.999],
      [0.999, 1.0, 1.002],
      [1.001, 0.998, 1.0]
    ];
    expect(hasArbitrage(exchangeRates), false);
  });
}
