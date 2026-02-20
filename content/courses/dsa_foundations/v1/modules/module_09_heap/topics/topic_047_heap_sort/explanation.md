## Heap Sort

### Two Phases

1. **Build max-heap** from the array in O(n)
2. **Repeatedly extract max**: swap root with last element, reduce heap size, sift-down — repeat n times

### Java Implementation

```java
class HeapSort {
    static void heapify(int[] arr, int n, int i) {
        int largest = i, l = 2 * i + 1, r = 2 * i + 2;
        if (l < n && arr[l] > arr[largest]) largest = l;
        if (r < n && arr[r] > arr[largest]) largest = r;
        if (largest != i) {
            int tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
            heapify(arr, n, largest);
        }
    }
    static void heapSort(int[] arr) {
        int n = arr.length;
        for (int i = n / 2 - 1; i >= 0; i--) heapify(arr, n, i);
        for (int i = n - 1; i > 0; i--) {
            int tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
            heapify(arr, i, 0);
        }
    }
    public static void main(String[] args) {
        int[] arr = {12, 11, 13, 5, 6, 7};
        heapSort(arr);
        for (int x : arr) System.out.print(x + " ");
    }
}
```

**Time: O(n log n) — all cases**  
**Space: O(1)** — in-place, only O(log n) recursion stack
