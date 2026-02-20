## Longest Increasing Subsequence (LIS)

### O(n²) DP

```java
class LIS_DP {
    static int lis(int[] arr) {
        int n = arr.length;
        int[] dp = new int[n];
        Arrays.fill(dp, 1);
        int max = 1;
        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (arr[j] < arr[i]) dp[i] = Math.max(dp[i], dp[j] + 1);
            }
            max = Math.max(max, dp[i]);
        }
        return max;
    }
}
```

### O(n log n) – Binary Search (Patience Sort)

```java
import java.util.*;
class LIS_BSearch {
    static int lis(int[] arr) {
        List<Integer> tails = new ArrayList<>();
        for (int x : arr) {
            int pos = Collections.binarySearch(tails, x);
            if (pos < 0) pos = -(pos + 1);
            if (pos == tails.size()) tails.add(x);
            else tails.set(pos, x);
        }
        return tails.size();
    }
}
```

**O(n²) DP / O(n log n) binary search**
