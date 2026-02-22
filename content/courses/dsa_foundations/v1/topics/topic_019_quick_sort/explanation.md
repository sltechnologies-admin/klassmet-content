# Quick Sort - In-Depth Explanation

## Lomuto Partition Scheme
Choose last element as pivot. Use index i to track boundary of smaller elements.

## Java Implementation

```java
class QuickSort {
    static int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (arr[j] < pivot) {
                i++;
                int temp = arr[i]; arr[i] = arr[j]; arr[j] = temp;
            }
        }
        // Place pivot at correct position
        int temp = arr[i+1]; arr[i+1] = arr[high]; arr[high] = temp;
        return i + 1;
    }
    static void quickSort(int[] arr, int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }
    public static void main(String[] args) {
        int[] arr = {10, 7, 8, 9, 1, 5};
        quickSort(arr, 0, arr.length - 1);
        for (int x : arr) System.out.print(x + " ");
        // Output: 1 5 7 8 9 10
    }
}
```

## Worst Case Avoidance
Use random pivot or median-of-three to prevent O(n^2) on sorted/reverse-sorted input.