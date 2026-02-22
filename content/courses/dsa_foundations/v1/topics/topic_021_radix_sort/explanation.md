# Radix Sort - In-Depth Explanation

## LSD (Least Significant Digit) Process
Sort passes: units -> tens -> hundreds -> ...

Example: [170, 45, 75, 90, 802, 24, 2, 66]
- After units pass:  [170, 90, 802, 2, 24, 45, 75, 66]
- After tens pass:   [802, 2, 24, 45, 66, 170, 75, 90]
- After hundreds:    [2, 24, 45, 66, 75, 90, 170, 802]

## Java Implementation

```java
class RadixSort {
    static void countSort(int[] arr, int exp) {
        int n = arr.length;
        int[] output = new int[n];
        int[] count = new int[10];
        for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
        for (int i = 1; i < 10; i++) count[i] += count[i-1];
        for (int i = n-1; i >= 0; i--) output[--count[(arr[i]/exp)%10]] = arr[i];
        for (int i = 0; i < n; i++) arr[i] = output[i];
    }
    static void radixSort(int[] arr) {
        int max = 0;
        for (int x : arr) if (x > max) max = x;
        for (int exp = 1; max/exp > 0; exp *= 10) countSort(arr, exp);
    }
    public static void main(String[] args) {
        int[] arr = {170,45,75,90,802,24,2,66};
        radixSort(arr);
        for (int x : arr) System.out.print(x + " ");
        // Output: 2 24 45 66 75 90 170 802
    }
}
```