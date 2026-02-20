## What is Sliding Window Technique?

Sliding window processes a **fixed-size subarray** efficiently by sliding a window across the array, adding the new element and removing the old one.

### Real-time Example

Calculating average temperature of the last 7 days:
- Instead of summing 7 days from scratch each day
- Remove yesterday-8 days ago, add today → O(1) update instead of O(7)

### Java Example – Maximum Sum Subarray of Size k

```java
class SlidingWindowExample {
    public static void main(String[] args) {
        int[] arr = {2, 1, 5, 1, 3, 2};
        int k = 3;
        int windowSum = 0;
        for (int i = 0; i < k; i++) {
            windowSum += arr[i];
        }
        int maxSum = windowSum;
        for (int i = k; i < arr.length; i++) {
            windowSum += arr[i] - arr[i - k];
            maxSum = Math.max(maxSum, windowSum);
        }
        System.out.println(maxSum);
    }
}
```

Avoids recomputing sums repeatedly.

**Time Complexity: O(n)**  
**Space Complexity: O(1)**
