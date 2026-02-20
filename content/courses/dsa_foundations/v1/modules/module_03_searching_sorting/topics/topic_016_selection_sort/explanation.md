# Selection Sort — In-Depth Explanation

## How It Works

Selection Sort divides the array into two parts: sorted (left) and unsorted (right). In each iteration, it scans the unsorted portion to find the minimum element, then swaps it with the first unsorted position.

### Visual Walkthrough

Array: [64, 25, 12, 22, 11]

| Pass | Min Found | Array After Swap |
|------|-----------|-----------------|
| 1 | 11 (index 4) | [**11**, 25, 12, 22, 64] |
| 2 | 12 (index 2) | [11, **12**, 25, 22, 64] |
| 3 | 22 (index 3) | [11, 12, **22**, 25, 64] |
| 4 | 25 (index 3) | [11, 12, 22, **25**, 64] |
| 5 | — | [11, 12, 22, 25, **64**] |

## Java Implementation

```java
class SelectionSort {
    static void selectionSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx]) {
                    minIdx = j;
                }
            }
            // Swap
            int temp = arr[minIdx];
            arr[minIdx] = arr[i];
            arr[i] = temp;
        }
    }

    public static void main(String[] args) {
        int[] arr = {64, 25, 12, 22, 11};
        selectionSort(arr);
        for (int x : arr) System.out.print(x + " ");
        // Output: 11 12 22 25 64
    }
}
```

## Key Points
- Always O(n²) regardless of input — no early exit
- Makes at most n-1 swaps (better than bubble sort)
- Not stable: equal elements can change relative order
- In-place: O(1) extra space
