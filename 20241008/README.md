### Problem: Runner's Route Optimization

A competitive runner would like to create a route that starts and ends at his house, with the condition that the route goes entirely **uphill** at first and then entirely **downhill**.

#### Task:
Given two dictionaries:
- One mapping **locations** to their respective **elevations**.
- Another mapping **paths** between some of these locations to their corresponding **distances**.

Find the length of the **shortest route** satisfying the condition that the runner starts and ends at **location 0**, going entirely uphill at first, and then entirely downhill.

#### Example:

Given the following input:

- **Elevations**:  
  `{0: 5, 1: 25, 2: 15, 3: 20, 4: 10}`

- **Paths**:  
```
  {  
    (0, 1): 10,  
    (0, 2): 8,  
    (0, 3): 15,  
    (1, 3): 12,  
    (2, 4): 10,  
    (3, 4): 5,  
    (3, 0): 17,  
    (4, 0): 10  
  }
```

#### Expected Output:

The shortest valid path that satisfies the condition is:  
**0 -> 2 -> 4 -> 0**, with a total distance of **28**.
