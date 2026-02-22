## What is Space Complexity?

Space complexity measures the **extra memory** used by an algorithm relative to the input size.

### Real-time Example

Using extra notebooks while solving math problems:
- If you solve everything in your head → O(1) extra space
- If you write intermediate steps in extra notebooks → space grows with problem size

### Types of Space

| Type | Description |
|------|-------------|
| Input space | Memory for the inputs |
| Auxiliary space | Extra memory used by the algorithm itself |

Space complexity usually refers to **auxiliary space**.

### Key Examples

**O(1) Space** – Only a fixed number of variables:

```java
class SpaceComplexityExample {
    static int square(int x) {
        int result = x * x;
        return result;
    }
    public static void main(String[] args) {
        System.out.println(square(5));
    }
}
```
Only one extra variable (`result`) is used → **Space Complexity: O(1)**

**O(n) Space** – Extra array of size n:

```java
int[] prefix = new int[n]; // O(n) space
```

### Recursive Functions and Stack Space

A recursive function uses the **call stack** to store each function call.

```java
static int factorial(int n) {
    if (n == 0) return 1;
    return n * factorial(n - 1); // n calls on the stack
}
```

Each recursive call adds a frame to the stack → **Space Complexity: O(n)** for n levels of recursion.
