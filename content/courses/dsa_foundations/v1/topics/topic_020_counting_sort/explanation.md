# Counting Sort - In-Depth Explanation

## Algorithm Steps
1. Find max value k in array
2. Create count[0..k] array, initialize to 0
3. Count: count[arr[i]]++ for each element
4. Reconstruct: place count[i] copies of i in output

## Java Implementation

```java
class CountingSort {
    static void countingSort(int[] arr) {
        int max = 0;
        for (int x : arr) if (x > max) max = x;
        int[] count = new int[max + 1];
        for (int x : arr) count[x]++;
        int idx = 0;
        for (int i = 0; i <= max; i++)
            while (count[i]-- > 0) arr[idx++] = i;
    }
    public static void main(String[] args) {
        int[] arr = {4, 2, 2, 8, 3, 3, 1};
        countingSort(arr);
        for (int x : arr) System.out.print(x + " ");
        // Output: 1 2 2 3 3 4 8
    }
}
```

## Stable Version
For stable output, build cumulative prefix sum of count array, then place elements from right to left.