### Problem: Implement a Bloom Filter

A **Bloom Filter** is a space-efficient probabilistic data structure used to test whether an element is a member of a set. It can yield false positives but never false negatives. This makes it particularly useful in scenarios where space is limited, and occasional false positives are acceptable.

### Approach:

This implementation simulates a **Bloom Filter** using bit-level operations in Dart, which does not have native support for boolean data types. Instead, the filter uses an 8-bit integer representation (`Uint8List`), where each bit represents the presence or absence of an element in the set.

Here’s a breakdown of the solution:

1. **Bit Array Representation**:
   - A `Uint8List` is used as the underlying data structure to simulate a bit array. Each byte in the `Uint8List` can represent 8 bits, and the size of the bit array is set to $\left(2^{24}\right)$ (i.e., 16,777,216 bits or approximately 2MB).

2. **Hash Functions**:
   The solution uses multiple hash functions to generate multiple bit positions for each element. These positions are where the bits will be flipped to indicate the presence of an element. 
   
   - Three hash functions are defined:
     - The first function uses the object's hash code multiplied by a constant.
     - The second function hashes the string representation of the object.
     - The third function hashes the object's runtime type.
   
   Each function ensures a wide distribution of bit positions across the bit array to minimize collisions.

3. **Adding an Element**:
   The `add` method:
   - Takes an element and applies each hash function to compute bit positions.
   - For each bit position, it determines the corresponding byte in the bit array (using integer division `pos ~/ 8`), and then sets the appropriate bit within that byte using bitwise OR operations.

4. **Checking for an Element**:
   The `check` method:
   - Computes the bit positions for the element using the same hash functions.
   - It checks whether all the bits corresponding to these positions are set to `1` in the bit array.
   - If all bits are set, the element **might** be in the set (but there is a chance of a false positive). If any bit is unset, the element is **definitely not** in the set.

### Key Concepts:

- **False Positives**: A Bloom Filter can return false positives (i.e., it may say an element is in the set when it isn't), but it will never return a false negative (i.e., if the filter says an element is not in the set, it's definitely not).
  
- **Bitwise Operations**: The core of the Bloom Filter is based on manipulating individual bits in a byte using bitwise operations (`OR` to set bits and `AND` to check them). This allows for efficient memory usage compared to a typical set or list structure.

### Conclusion:

This implementation of a Bloom Filter provides a simple and space-efficient way to test set membership with a tradeoff in accuracy. It uses multiple hash functions to map elements to bit positions, and bitwise operations to manage the bit array. The Bloom Filter can handle a large set of elements while consuming minimal memory and maintaining constant time complexity **O(1)** for both adding and checking elements.
