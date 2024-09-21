### Problem: Minimum Interval Removal to Avoid Overlaps

#### Description
Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals **non-overlapping**.

Intervals can "touch", meaning two intervals like `[0, 1]` and `[1, 2]` are not considered overlapping.

#### Example
Consider the following intervals:

- `(7, 9)`
- `(2, 4)`
- `(5, 8)`

In this case, you can remove the interval `(5, 8)` to avoid overlaps, leaving you with the intervals `(7, 9)` and `(2, 4)` which do not overlap.

Thus, the expected result is: `1`


---

#### Task
Write a function that:
1. Accepts a list of intervals as input.
2. Returns the minimum number of intervals you need to remove so that the rest of the intervals are **non-overlapping**.

#### Notes
- The intervals are not necessarily sorted in any order.
- You may assume that the input list contains at least one interval.
