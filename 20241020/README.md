## Problem Statement

You are given a table of currency exchange rates, represented as a 2D array `exchangeRates`, where `exchangeRates[i][j]` is the rate of currency `i` to currency `j`. Your task is to determine whether there is a possible arbitrage opportunity. An arbitrage opportunity occurs if there is some sequence of trades starting with an amount of currency `A`, which allows you to end up with an amount greater than `A` of the same currency.

The input can be assumed to be a square matrix (i.e., the number of rows is equal to the number of columns), and fractional trades are allowed.

### Example

Consider the following exchange rates:

    exchangeRates = [
        [1.0, 0.5, 2.0],
        [2.0, 1.0, 4.0],
        [0.5, 1.0, 1.0]
    ]

Starting with currency 0 (first row), you can trade:

    - 1 unit of currency 0 for 2 units of currency 2 (exchangeRates[0][2])
    - 2 units of currency 2 for 4 units of currency 1 (exchangeRates[2][1])
    - 4 units of currency 1 for 8 unit of currency 0 (exchangeRates[1][0])

Thus, you can turn 1 unit of currency 0 into 8 units of currency 0 through a sequence of trades, which results in an arbitrage opportunity.
