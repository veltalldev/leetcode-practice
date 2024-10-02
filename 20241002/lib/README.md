### Problem: Determine if a 32-bit Integer is a Power of Four

The goal of this problem is to determine whether a given integer is a power of four. A number is considered a power of four if it can be expressed as `4^k` for some integer `k`. For example:  
- 1 (`4^0`)  
- 4 (`4^1`)  
- 16 (`4^2`)  
  
### Approach:

This solution uses **bitwise operations** to efficiently check if the given number is a power of four. Let's break down the approach step by step:

1. **Powers of 4 are powers of 2:**  
   Every power of 4 is also a power of 2, meaning it has only one set bit in its binary representation. For example:  
   - `4^0 = 1` → Binary: `00001`  
   - `4^1 = 4` → Binary: `00100`  
   - `4^2 = 16` → Binary: `10000`  
   
   From this, we can conclude that the number must have exactly **one set bit** (i.e., it must be a power of 2). To check if a number has only one set bit, we use the following expression:  
   `num & (num - 1) == 0`  
   This works because subtracting 1 from a number flips all the bits below the most significant set bit, and the `&` operation will result in 0 if there was only one set bit.

2. **Set bit must be in an odd position:**  
   Powers of 4 specifically have their set bit in an **odd position** in the binary representation. For instance:  
   - `4^0 = 1` → Set bit is in position 1  
   - `4^1 = 4` → Set bit is in position 3  
   - `4^2 = 16` → Set bit is in position 5  

   We use a **bitmask** to ensure that the set bit is in an odd position:  
   `0x55555555  // Binary: 01010101010101010101010101010101`  
   By applying this mask and performing a bitwise AND, we check if the set bit lies in one of these odd positions:  
   `num & 0x55555555 != 0`

### Conclusion:

The solution combines these two checks:  
1. The number must be a power of 2 (i.e., it has exactly one set bit).  
2. The set bit must be in an odd position to confirm it's a power of 4.

If both conditions are satisfied, the number is indeed a power of 4.
