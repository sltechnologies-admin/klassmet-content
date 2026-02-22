## DP – Advanced Problems

### Coin Change (Minimum Coins)

```java
class CoinChange {
    static int minCoins(int[] coins, int amount) {
        int[] dp = new int[amount + 1];
        Arrays.fill(dp, amount + 1);
        dp[0] = 0;
        for (int i = 1; i <= amount; i++) {
            for (int c : coins) {
                if (c <= i) dp[i] = Math.min(dp[i], dp[i - c] + 1);
            }
        }
        return dp[amount] > amount ? -1 : dp[amount];
    }
}
```

**Time: O(amount × coins), Space: O(amount)**

### Edit Distance (Levenshtein)

```
dp[i][j] = min operations to convert s1[0..i] to s2[0..j]
  = 0 if s1[i]==s2[j]  (extend dp[i-1][j-1])
  = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])  (delete/insert/replace)
```

**Time: O(m × n), Space: O(m × n)**

### Matrix Chain Multiplication

Split point k that minimises total multiplications:

```
dp[i][j] = min cost to multiply matrices i..j
          = min over k of dp[i][k] + dp[k+1][j] + rows[i]*cols[k]*cols[j]
```

**Time: O(n³), Space: O(n²)**
