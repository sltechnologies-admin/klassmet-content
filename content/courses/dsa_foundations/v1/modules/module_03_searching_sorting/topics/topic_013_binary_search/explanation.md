# Binary Search

## Definition
Binary Search is an efficient algorithm that finds a target in a **sorted** array by repeatedly halving the search space. It compares the target with the middle element and eliminates half of the remaining elements each iteration.

## Real-World Example
Searching for a word in a dictionary: you open the middle page. If your word comes before the middle, you search the left half; if after, the right half. You keep halving until you find it — this is exactly binary search.

## How It Works
1. Set `low = 0`, `high = arr.length - 1`.
2. Calculate `mid = (low + high) / 2`.
3. If `arr[mid] == target`, return `mid`.
4. If `arr[mid] < target`, set `low = mid + 1` (search right half).
5. If `arr[mid] > target`, set `high = mid - 1` (search left half).
6. Repeat until `low > high`. Return -1 if not found.

## Java Implementation

```java
public class BinarySearch {
    public static int search(int[] arr, int target) {
        int low = 0, high = arr.length - 1;
        while (low <= high) {
            int mid = low + (high - low) / 2; // avoids overflow
            if (arr[mid] == target) return mid;
            else if (arr[mid] < target) low = mid + 1;
            else high = mid - 1;
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] arr = {1, 3, 5, 7, 9, 11, 13};
        int target = 7;
        int result = search(arr, target);
        System.out.println(result != -1 ? "Found at index: " + result : "Not found");
    }
}
```

## Complexity Analysis

| Case        | Time Complexity | Space Complexity |
|-------------|----------------|-----------------|
| Best Case   | O(1)           | O(1)            |
| Worst Case  | O(log n)       | O(1)            |
| Average     | O(log n)       | O(1)            |

- Each iteration eliminates half the search space, giving logarithmic time.
- No extra space required — O(1) iterative solution.

## Prerequisites
- Array must be **sorted** before applying binary search.
