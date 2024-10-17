## Follow-up Interview Questions

### How would you optimize your solution if the input string was extremely large?

The algorithm already runs in linear time so I don't think there is any improvements to achieve by changing it. To handle a large string, we would probably have to process it by segments. Fortunately the algorithm does not require a global context to do its job; it merely processes the input on a local level and maintain a global state via the counter variables. This means that we don't need knowledge of the segments that we have not yet processed, so they might as well sit in a file or a database somewhere until time to be processed.

### Can you modify the solution to work without extra space, while keeping the time complexity optimal?
I mean, it's two integer variables, what do you want from me.


### How would your solution change if the `*` character could only represent a single character, either `(` or `)`?
Then the choice would be between that character or nothing. Let's look at each situation separately:

- If the wildcard character `*` can only become `(` or stay as an empty string:
  The logic would still be the same, but there would be less choices to track. Our high estimate will now reflect the choice of an open parenthesis and our low estimate will reflect the choice of an empty string. Our understanding of the low and high values should remain unchanged.

- If the wildcard character `*` can only become `)` or stay as an empty string:
  Similarly, `low` would now reflect the aggressively-closing choice of `)` and `high` would reflect the choice of an empty string. The rest is the same.