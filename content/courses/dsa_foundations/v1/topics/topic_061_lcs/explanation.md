## Longest Common Subsequence (LCS)

### Recurrence

```
If s1[i] == s2[j]: dp[i][j] = dp[i-1][j-1] + 1
Else:              dp[i][j] = max(dp[i-1][j], dp[i][j-1])
```

### Java Implementation

```java
class LCS {
    static int lcs(String s1, String s2) {
        int m = s1.length(), n = s2.length();
        int[][] dp = new int[m + 1][n + 1];
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (s1.charAt(i - 1) == s2.charAt(j - 1))
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                else
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
        return dp[m][n];
    }
    public static void main(String[] args) {
        System.out.println(lcs("ABCBDAB", "BDCAB")); // 4
    }
}
```

**Time: O(m × n), Space: O(m × n)**

### Applications
- git diff / text diff
- DNA sequence alignment
- Spell checking edit distance
