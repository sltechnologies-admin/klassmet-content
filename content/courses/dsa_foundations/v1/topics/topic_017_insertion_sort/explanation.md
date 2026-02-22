# Insertion Sort - In-Depth Explanation

## How It Works
Take each element (key) and insert into correct position in already-sorted left portion.

Example: [12, 11, 13, 5, 6]
- i=1: key=11, shift 12 right -> [11, 12, 13, 5, 6]
- i=2: key=13, no shift -> [11, 12, 13, 5, 6]
- i=3: key=5, shift 13,12,11 -> [5, 11, 12, 13, 6]
- i=4: key=6, shift 13,12,11 -> [5, 6, 11, 12, 13]

## Java Implementation

```java
class InsertionSort {
    static void insertionSort(int[] arr) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
    public static void main(String[] args) {
        int[] arr = {12, 11, 13, 5, 6};
        insertionSort(arr);
        for (int x : arr) System.out.print(x + " "); // Output: 5 6 11 12 13
    }
}
```

## Key Points
- Stable algorithm: preserves relative order of equal elements
- Adaptive: faster on nearly sorted input
- Online: can process elements as they arrive
- In-place: O(1) extra space