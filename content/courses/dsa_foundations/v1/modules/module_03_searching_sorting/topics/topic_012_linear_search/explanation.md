# Linear Search

## Definition
Linear Search is the simplest searching algorithm that checks each element in a collection sequentially from the beginning until the target element is found or the entire list is traversed.

## Real-World Example
Imagine looking for a specific book in a library where books are not organized. You would go shelf by shelf, book by book, checking each title until you find the one you want. This is exactly how linear search works.

## How It Works
1. Start from the first element (index 0).
2. Compare the current element with the target.
3. If matched, return the index.
4. If not, move to the next element.
5. If end is reached without finding, return -1.

## Java Implementation

```java
public class LinearSearch {
    public static int search(int[] arr, int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                return i; // Found at index i
            }
        }
        return -1; // Not found
    }

    public static void main(String[] args) {
        int[] arr = {4, 2, 7, 1, 9, 3};
        int target = 7;
        int result = search(arr, target);
        if (result != -1) {
            System.out.println("Element found at index: " + result);
        } else {
            System.out.println("Element not found");
        }
    }
}
```

## Complexity Analysis

| Case        | Time Complexity | Space Complexity |
|-------------|----------------|-----------------|
| Best Case   | O(1)           | O(1)            |
| Worst Case  | O(n)           | O(1)            |
| Average     | O(n)           | O(1)            |

- **Best case**: Target is the first element.
- **Worst case**: Target is the last element or not present.
- **Space**: No extra space needed — O(1).

## When to Use
- Small datasets.
- Unsorted arrays where binary search is not applicable.
- When simplicity is preferred over performance.
