## Circular Queue

A simple array queue leaves empty slots that were dequeued at the front. A circular queue uses modulus arithmetic to wrap around and reuse those slots.

### Java Example

```java
class CircularQueue {
    int[] arr; int front = 0, rear = -1, size = 0, capacity;
    CircularQueue(int cap) { capacity = cap; arr = new int[cap]; }
    void enqueue(int x) {
        if (size == capacity) { System.out.println("Full"); return; }
        rear = (rear + 1) % capacity;
        arr[rear] = x; size++;
    }
    int dequeue() {
        if (size == 0) throw new RuntimeException("Empty");
        int val = arr[front];
        front = (front + 1) % capacity;
        size--; return val;
    }
}
```

**Time Complexity: O(1)** per operation  
**Space Complexity: O(n)**
