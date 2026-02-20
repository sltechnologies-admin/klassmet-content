## Dynamic Programming (DP)

DP applies when a problem has:
1. **Overlapping Subproblems** — same subproblems recalculated multiple times
2. **Optimal Substructure** — optimal solution built from optimal sub-solutions

### Fibonacci – Memoization (Top-Down)

```java
import java.util.*;
class FibMemo {
    static Map<Integer, Long> memo = new HashMap<>();
    static long fib(int n) {
        if (n <= 1) return n;
        if (memo.containsKey(n)) return memo.get(n);
        long result = fib(n - 1) + fib(n - 2);
        memo.put(n, result);
        return result;
    }
}
```

### Fibonacci – Tabulation (Bottom-Up)

```java
class FibTab {
    static long fib(int n) {
        if (n <= 1) return n;
        long[] dp = new long[n + 1];
        dp[0] = 0; dp[1] = 1;
        for (int i = 2; i <= n; i++) dp[i] = dp[i - 1] + dp[i - 2];
        return dp[n];
    }
}
```

**Both: Time O(n), Space O(n) (O(1) with rolling variable)**
