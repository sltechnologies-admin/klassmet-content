## What is a Heap?

A heap is a **complete binary tree** stored as an array. The root is always the minimum (min-heap) or maximum (max-heap).

### Array Representation

For node at index `i`:
- Left child: `2i + 1`
- Right child: `2i + 2`
- Parent: `(i - 1) / 2`

### Java Max-Heap Insert & Heapify

```java
class MaxHeap {
    int[] arr;
    int size = 0;
    MaxHeap(int cap) { arr = new int[cap]; }
    void insert(int val) {
        arr[size] = val;
        int i = size++;
        while (i > 0 && arr[(i - 1) / 2] < arr[i]) {
            int p = (i - 1) / 2;
            int tmp = arr[i]; arr[i] = arr[p]; arr[p] = tmp;
            i = p;
        }
    }
    public static void main(String[] args) {
        MaxHeap h = new MaxHeap(10);
        h.insert(3); h.insert(1); h.insert(6); h.insert(5);
        System.out.println(h.arr[0]); // 6 (max)
    }
}
```

| Operation | Time |
|-----------|------|
| insert | O(log n) |
| getMax/Min | O(1) |
| removeMax/Min | O(log n) |
| buildHeap | O(n) |

**Space: O(n)**
