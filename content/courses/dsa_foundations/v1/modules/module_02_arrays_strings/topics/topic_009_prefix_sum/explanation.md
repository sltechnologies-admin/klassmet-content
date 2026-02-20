## What is Prefix Sum?

Prefix sum is used to **precompute cumulative sums** for fast range queries.

Without prefix sum, finding the sum of elements from index `l` to `r` takes O(n) every time.  
With prefix sum, it becomes **O(1)**.

### Real-time Example

Monthly expense running total:
- Jan: 100, Feb: 200, Mar: 300, Apr: 400
- prefix: [100, 300, 600, 1000]
- Sum from Feb to Apr? → prefix[3] - prefix[0] = 900 (instant!)

### Java Example – Prefix Sum

```java
class PrefixSumExample {
    public static void main(String[] args) {
        int[] arr = {2, 4, 6, 8};
        int[] prefix = new int[arr.length];
        prefix[0] = arr[0];
        for (int i = 1; i < arr.length; i++) {
            prefix[i] = prefix[i - 1] + arr[i];
        }

        // Sum from index 1 to 3
        int l = 1, r = 3;
        int sum = prefix[r] - prefix[l - 1];
        System.out.println(sum);
    }
}
```

Range sum queries become O(1).

**Time Complexity:**
- Build: O(n)
- Query: O(1)

**Space Complexity: O(n)**
