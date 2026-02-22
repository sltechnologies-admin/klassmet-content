## 0/1 Knapsack

### Recurrence

```
dp[i][w] = max value using first i items with capacity w
         = max(dp[i-1][w],        // skip item i
               dp[i-1][w-wt[i]] + val[i])  // include item i (if w >= wt[i])
```

### Java Implementation

```java
class Knapsack01 {
    static int knapsack(int[] wt, int[] val, int W) {
        int n = wt.length;
        int[][] dp = new int[n + 1][W + 1];
        for (int i = 1; i <= n; i++) {
            for (int w = 0; w <= W; w++) {
                dp[i][w] = dp[i - 1][w];
                if (wt[i - 1] <= w)
                    dp[i][w] = Math.max(dp[i][w],
                        dp[i - 1][w - wt[i - 1]] + val[i - 1]);
            }
        }
        return dp[n][W];
    }
    public static void main(String[] args) {
        int[] wt = {1, 2, 3};
        int[] val = {6, 10, 12};
        System.out.println(knapsack(wt, val, 5)); // 22
    }
}
```

**Time: O(n × W), Space: O(n × W)** (optimizable to O(W) with 1D array)
