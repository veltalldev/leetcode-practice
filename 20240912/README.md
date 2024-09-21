# Closest Pair of Points in a 2D Cartesian Plane

## Problem Definition

### Objective
Given a set of points represented by their coordinates `(x, y)` on a 2D Cartesian plane, determine the **two closest points**. The distance between any two points is calculated using the Euclidean distance formula.

### Example

Consider the following set of points:

`[(1, 1), (-1, -1), (3, 4), (6, 1), (-1, -6), (-4, -3)]`


The closest pair of points is **[(-1, -1), (1, 1)]**, as the distance between these two points is the smallest.


### Notes
- The input is a list of points where each point is represented as a tuple `(x, y)`.
- The output should be the two points that are closest to each other in the plane.
- If there are multiple pairs of points with the same minimum distance, return any one pair.
