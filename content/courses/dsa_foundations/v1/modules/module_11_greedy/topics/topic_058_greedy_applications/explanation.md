## Greedy Applications

### Job Sequencing with Deadlines

```java
import java.util.*;
class JobSequencing {
    static int maxProfit(int[][] jobs) {
        // jobs[i] = {deadline, profit}
        Arrays.sort(jobs, (a, b) -> b[1] - a[1]);
        int maxD = 0;
        for (int[] j : jobs) maxD = Math.max(maxD, j[0]);
        boolean[] slot = new boolean[maxD + 1];
        int profit = 0;
        for (int[] j : jobs) {
            for (int t = j[0]; t >= 1; t--) {
                if (!slot[t]) { slot[t] = true; profit += j[1]; break; }
            }
        }
        return profit;
    }
}
```

### Huffman Encoding

- Build frequency min-heap of characters
- Repeatedly merge two lowest-frequency nodes
- Produces optimal prefix-free codes
- **Time: O(n log n)**

### When Greedy Fails

| Problem | Greedy | Correct Approach |
|---------|--------|-----------------|
| 0/1 Knapsack | Incorrect | DP |
| Coin change (arbitrary coins) | May fail | DP |
| Longest path in DAG | Fails | DP |
