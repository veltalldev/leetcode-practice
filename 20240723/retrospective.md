The naive solution uses a custom LinkedList class which is a bad idea
because:

1. it takes time to write and debug
2. ironically in the interest of time, it makes some wild assumptions 
3. it isn't proven to be null-safe

### Improvement ideas

- use a collection class from the language's library
- consider a different approach such as working directly on the input string instead of modifying it