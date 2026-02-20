# Bubble Sort

## Definition
Bubble Sort is a simple comparison-based sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. Each pass moves the largest unsorted element to its correct position at the end.

## Real-World Example
Imagine bubbles rising in water — larger bubbles rise faster to the surface. Similarly, in bubble sort, larger elements "bubble up" to the end of the array with each pass.

## How It Works
1. Outer loop runs n-1 times.
2. Inner loop compares adjacent pairs from index 0 to n-1-i.
3. If `arr[j] > arr[j+1]`, swap them.
4. After each pass, the largest element is in its correct position.
5. Optimization: if no swap in a pass, the array is sorted — break early.

## Java Implementation

```java
public class BubbleSort {
    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            boolean swapped = false;
            for (int j = 0; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    // Swap
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }
            if (!swapped) break; // Already sorted
        }
    }

    public static void main(String[] args) {
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        bubbleSort(arr);
        for (int x : arr) System.out.print(x + " ");
    }
}
```

**Output:** `11 12 22 25 34 64 90`

## Complexity Analysis

| Case        | Time Complexity | Space Complexity |
|-------------|----------------|-----------------|
| Best Case   | O(n)           | O(1)            |
| Worst Case  | O(n²)          | O(1)            |
| Average     | O(n²)          | O(1)            |

- **Best case** (already sorted with optimization): O(n) — no swaps needed.
- **Worst case** (reverse sorted): O(n²) — maximum comparisons and swaps.
- In-place sort: O(1) space.

## Properties
- **Stable**: equal elements maintain relative order.
- **Comparison-based**: sorts by comparing elements.
- **In-place**: no extra space needed.
