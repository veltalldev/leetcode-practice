# Word Chain Circle Problem

## Problem Definition

### Objective
Given a list of words, determine if the words can be arranged in a circular manner such that the last character of each word matches the first character of the next word in the circle. The last word in the arrangement must connect to the first word, completing the circle.

A word **X** can be placed before another word **Y** in the circle if and only if the **last character** of **X** is the **same as the first character** of **Y**.

### Example

Consider the following list of words:

`['chair', 'height', 'racket', 'touch', 'tunic']`


The words can be arranged in the following circle:

`chair --> racket --> touch --> height --> tunic --> chair`


In this arrangement:
- The last character of "chair" ('r') matches the first character of "racket".
- The last character of "racket" ('t') matches the first character of "touch", and so on, forming a complete circle.

### Notes
- The input is a non-empty list of strings, each containing at least one character.
- The solution must determine if such a circular arrangement is possible and return **True** if it is, otherwise return **False**.
- All words must be used exactly once to form the circle.
