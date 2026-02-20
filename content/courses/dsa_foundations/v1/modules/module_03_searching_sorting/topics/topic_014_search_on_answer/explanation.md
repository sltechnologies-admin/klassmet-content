# Search on Answer

## Definition
Search on Answer (also called Binary Search on the Answer Space) is a technique where instead of searching in a data array, you apply binary search over all possible answers. The key insight is that the answer space must be **monotonic** — a condition is either satisfied for all values above a threshold or below it.

## Real-World Example
Finding the minimum speed to complete a journey on time: if speed 5 km/h is too slow but speed 10 km/h is enough, then all speeds ≥ 10 also work. You binary search between min and max possible speeds to find the exact minimum.

## When to Use
- "Find the minimum/maximum value such that a condition holds."
- The answer lies in a numeric range.
- Checking if a given answer is feasible can be done in O(n) or O(n log n).

## Java Implementation: Square Root using Search on Answer

```java
public class SearchOnAnswer {
    // Find integer square root of n using binary search on answer
    public static int sqrt(int n) {
        if (n < 2) return n;
        int low = 1, high = n / 2;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            long sq = (long) mid * mid;
            if (sq == n) return mid;
            else if (sq < n) low = mid + 1;
            else high = mid - 1;
        }
        return high; // floor of sqrt
    }

    public static void main(String[] args) {
        System.out.println(sqrt(25));  // Output: 5
        System.out.println(sqrt(10));  // Output: 3
    }
}
```

## Complexity Analysis

| Case        | Time Complexity | Space Complexity |
|-------------|----------------|-----------------|
| Typical     | O(n log(range))| O(1)            |

- **log(range)**: binary search iterations over the answer space.
- **n**: cost of the feasibility check function.

## Key Pattern
```
low = minimum_possible_answer
high = maximum_possible_answer
while (low <= high):
    mid = (low + high) / 2
    if isFeasible(mid):
        answer = mid
        high = mid - 1  // if looking for minimum
    else:
        low = mid + 1
```
