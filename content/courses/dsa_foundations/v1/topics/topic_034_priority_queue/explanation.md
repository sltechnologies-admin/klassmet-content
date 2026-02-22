## Priority Queue

Unlike a regular queue, a priority queue orders elements by priority. Java's `PriorityQueue` is a min-heap by default — the smallest element is at the head.

### Java Example

```java
import java.util.PriorityQueue;
class PriorityQueueExample {
    public static void main(String[] args) {
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        pq.add(30); pq.add(10); pq.add(20);
        System.out.println(pq.poll()); // 10 (min)
        System.out.println(pq.poll()); // 20
    }
}
```

| Operation | Time |
|-----------|------|
| add (offer) | O(log n) |
| poll (remove min) | O(log n) |
| peek | O(1) |

**Applications**: Dijkstra's shortest path, task scheduling, Huffman encoding.
