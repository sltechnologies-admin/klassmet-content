## Greedy Algorithms

### Greedy Choice Property

A greedy algorithm always picks the best available option at the current step without reconsidering.

### Activity Selection Problem

Given activities with start/end times, select the maximum number of non-overlapping activities.

```java
import java.util.*;
class ActivitySelection {
    static int maxActivities(int[] start, int[] end) {
        int n = start.length;
        Integer[] idx = new Integer[n];
        for (int i = 0; i < n; i++) idx[i] = i;
        Arrays.sort(idx, Comparator.comparingInt(i -> end[i]));
        int count = 1, lastEnd = end[idx[0]];
        for (int i = 1; i < n; i++) {
            if (start[idx[i]] >= lastEnd) {
                count++;
                lastEnd = end[idx[i]];
            }
        }
        return count;
    }
    public static void main(String[] args) {
        int[] s = {1, 3, 0, 5, 8, 5};
        int[] e = {2, 4, 6, 7, 9, 9};
        System.out.println(maxActivities(s, e)); // 4
    }
}
```

**Time: O(n log n)** (sorting)  
**Space: O(n)**

### Greedy vs DP

| | Greedy | DP |
|---|---|---|
| Choices | Single local choice | All subproblems |
| Substructure | Required | Required |
| Overlapping subproblems | Not needed | Required |
| Speed | Usually faster | Slower but optimal for more cases |
