## What is an Array?

An array is a collection of elements of the **same data type** stored in **contiguous memory locations**.

### Real-time Example

Seats in a cinema hall row:
- Each seat has a fixed number → array index
- You can jump directly to seat 5 → O(1) access by index
- Seats are sequential in a row → contiguous memory

### Key Properties

| Property | Detail |
|----------|--------|
| Index-based access | O(1) |
| Traversal | O(n) |
| Insertion at end | O(1) |
| Insertion at middle | O(n) (shift required) |
| Fixed size | Size declared at creation |

### Java Example – 1D Array

```java
class ArrayExample {
    public static void main(String[] args) {
        int[] arr = {10, 20, 30, 40};
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }
    }
}
```

Elements are accessed using their index starting from 0.

**Time Complexity: O(n)** for traversal  
**Space Complexity: O(n)** for storing n elements
