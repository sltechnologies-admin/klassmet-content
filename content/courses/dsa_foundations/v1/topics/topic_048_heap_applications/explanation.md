## Heap Applications

### Top-K Largest Elements

Maintain a min-heap of size K. For every new element, if it is larger than the heap's root, replace the root and heapify.

```java
import java.util.PriorityQueue;
class TopK {
    static int[] topK(int[] arr, int k) {
        PriorityQueue<Integer> minHeap = new PriorityQueue<>();
        for (int x : arr) {
            minHeap.add(x);
            if (minHeap.size() > k) minHeap.poll();
        }
        return minHeap.stream().mapToInt(i -> i).toArray();
    }
}
```

**Time: O(n log k) — better than sorting O(n log n)**

### Running Median

- **maxHeap** (lower half) and **minHeap** (upper half)
- Median is average of both tops (even) or top of larger heap (odd)

### Other Uses
| Application | Heap type |
|-------------|-----------|
| Task scheduling | Max-heap (priority) |
| Dijkstra's shortest path | Min-heap |
| Huffman encoding | Min-heap |
| Kth largest/smallest | Min-heap / Max-heap |
