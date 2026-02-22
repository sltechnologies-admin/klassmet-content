## What is Time Complexity?

Time complexity measures how execution time grows with input size.

It does **not** measure actual clock time — it measures the *growth rate* of operations as the input `n` increases.

### Real-time Example

Searching a name in a phone book:

- **Linear search** — check every entry one by one → time grows with n → **O(n)**
- **Binary search** — keep halving the search space → time grows logarithmically → **O(log n)**

### Common Time Complexities

| Notation | Name | Example |
|----------|------|---------|
| O(1) | Constant | Array access by index |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Single loop |
| O(n log n) | Linearithmic | Merge sort |
| O(n²) | Quadratic | Nested loop |

### Java Example – Single Loop → O(n)

```java
class TimeComplexityExample {
    public static void main(String[] args) {
        int n = 5;
        for (int i = 0; i < n; i++) {
            System.out.println(i);
        }
    }
}
```

Loop runs n times → **Time Complexity: O(n)**

### Nested Loop → O(n²)

```java
for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
        // O(n²)
    }
}
```

### Best Case vs Worst Case

- **Best case** – Minimum time taken (e.g. element found at first position).
- **Worst case** – Maximum time taken (e.g. element at last position or not found).
