# Merge Sort - In-Depth Explanation

## Divide and Conquer Strategy
1. Divide: Split array into two halves
2. Conquer: Recursively sort each half
3. Combine: Merge the two sorted halves

## Recursion Tree for [38,27,43,3]
```
         [38,27,43,3]
        /            \
   [38,27]          [43,3]
   /     \          /    \
 [38]   [27]     [43]   [3]
   \     /          \   /
  [27,38]          [3,43]
        \          /
       [3,27,38,43]
```

## Java Implementation

```java
class MergeSort {
    static void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1, n2 = r - m;
        int[] L = new int[n1], R = new int[n2];
        for (int i = 0; i < n1; i++) L[i] = arr[l + i];
        for (int j = 0; j < n2; j++) R[j] = arr[m + 1 + j];
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2)
            arr[k++] = (L[i] <= R[j]) ? L[i++] : R[j++];
        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
    static void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = (l + r) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }
    public static void main(String[] args) {
        int[] arr = {38, 27, 43, 3, 9, 82, 10};
        mergeSort(arr, 0, arr.length - 1);
        for (int x : arr) System.out.print(x + " ");
        // Output: 3 9 10 27 38 43 82
    }
}
```