## What is Recursion?

Recursion is a technique where a **function calls itself** until a **base condition** is met.

### Real-time Example

Russian dolls (Matryoshka): each doll contains a smaller doll inside, until you reach the smallest doll that contains nothing — that is the base case.

### Two Essential Parts

| Part | Role |
|------|------|
| Base case | Stops the recursion |
| Recursive call | Reduces the problem size toward the base case |

### Java Example – Factorial

```java
class RecursionExample {
    static int factorial(int n) {
        if (n == 0) // base case
            return 1;
        return n * factorial(n - 1);
    }
    public static void main(String[] args) {
        System.out.println(factorial(5)); // 120
    }
}
```

- Base case stops recursion at `n == 0`
- Each recursive call reduces `n` by 1

**Time Complexity: O(n)**  
**Space Complexity: O(n)** — call stack holds n frames
