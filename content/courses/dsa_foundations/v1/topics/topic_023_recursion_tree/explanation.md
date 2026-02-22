## What is a Recursion Tree?

A recursion tree shows how **recursive calls expand and combine**, representing every function call as a node with its sub-calls as children.

### Real-time Example

Family tree expansion: a grandparent has children, each child has more children — the tree keeps growing until it reaches individuals with no children (base cases).

### Fibonacci Recursion Tree

`fib(4)` expands to:

```
fib(4)
├── fib(3)
│   ├── fib(2)
│   │   ├── fib(1) → 1
│   │   └── fib(0) → 0
│   └── fib(1) → 1
└── fib(2)
    ├── fib(1) → 1
    └── fib(0) → 0
```

Notice `fib(2)` is computed **twice** — this is an overlapping subproblem that Dynamic Programming solves.

### Java Example – Fibonacci

```java
class RecursionTree {
    static int fib(int n) {
        if (n <= 1)
            return n;
        return fib(n - 1) + fib(n - 2);
    }
    public static void main(String[] args) {
        System.out.println(fib(5));
    }
}
```

**Time Complexity: O(2ⁿ)** — exponential due to repeated calls  
**Space Complexity: O(n)** — maximum depth of call stack
