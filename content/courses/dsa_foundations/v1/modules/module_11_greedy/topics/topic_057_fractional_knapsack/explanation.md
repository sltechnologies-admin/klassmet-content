## Fractional Knapsack

### Problem

Given items with weight and value, and capacity W, maximize the total value. Items can be split (fractional).

```java
import java.util.*;
class FractionalKnapsack {
    static double knapsack(int[] weight, int[] value, int W) {
        int n = weight.length;
        Integer[] idx = new Integer[n];
        for (int i = 0; i < n; i++) idx[i] = i;
        Arrays.sort(idx, (a, b) -> Double.compare(
            (double) value[b] / weight[b],
            (double) value[a] / weight[a]));
        double total = 0;
        for (int i : idx) {
            if (W >= weight[i]) {
                total += value[i];
                W -= weight[i];
            } else {
                total += (double) value[i] * W / weight[i];
                break;
            }
        }
        return total;
    }
}
```

**Time: O(n log n), Space: O(n)**

### Fractional vs 0/1 Knapsack

| | Fractional | 0/1 |
|---|---|---|
| Item split | Yes | No |
| Greedy works | Yes | No |
| Algorithm | Sort by ratio | DP |
