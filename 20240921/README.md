# Airbnb Rounding Problem - Dynamic Programming Solution

## Problem Definition

You are given an array `X` of floating-point numbers `x_1, x_2, ..., x_n`. These numbers can be rounded **up** or **down** to create a corresponding array `Y` of integers `y_1, y_2, ..., y_n`.

The goal is to find an array `Y` that satisfies the following two properties:

1. **Equal Sum**: The sum of the rounded numbers must match the rounded sum of the original array.
   
   $$\sum _{y_i \in Y} y_i = \sum _{x_i \in X} x_i $$

2. **Minimized Error**: The total absolute error between the elements of `X` and `Y` should be minimized. In other words, you want to:

    $$\min_{y_i \in Y} \sum_{i=0}^n |y_i - x_i|$$