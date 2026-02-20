## Bit Masks

### Enumerate All Subsets

For n elements, iterate mask from 0 to (1<<n)-1. Check bit i: `(mask >> i) & 1`.

```java
class SubsetEnum {
    static void allSubsets(int[] arr) {
        int n = arr.length;
        for (int mask = 0; mask < (1 << n); mask++) {
            System.out.print("{ ");
            for (int i = 0; i < n; i++) {
                if ((mask >> i & 1) == 1) System.out.print(arr[i] + " ");
            }
            System.out.println("}");
        }
    }
}
```

**Time: O(2^n × n), Space: O(1)**

### Bitmask DP Example – TSP

State: `(current_city, visited_mask)` → minimum cost.  
Table size: `n × 2^n` — feasible for n ≤ 20.

### Applications
- Subset-sum DP
- Travelling Salesman Problem (TSP)
- Feature flag combinations
- Graph colouring
