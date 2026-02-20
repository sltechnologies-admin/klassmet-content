## What is a Queue?

A queue follows **FIFO** — First In, First Out. The first element added is the first removed.

### Real-time Example

Bank counter: customers join the queue at the rear and are served from the front in the order they arrived.

### Core Operations

| Operation | Description | Time |
|-----------|-------------|------|
| enqueue(x) | Add to rear | O(1) |
| dequeue() | Remove from front | O(1) |
| peek() | View front | O(1) |
| isEmpty() | Check if empty | O(1) |

### Java Example – Queue Using Array

```java
class QueueArray {
    int[] arr;
    int front = 0, rear = -1, size = 0;
    QueueArray(int capacity) { arr = new int[capacity]; }
    void enqueue(int x) { arr[++rear] = x; size++; }
    int dequeue() { size--; return arr[front++]; }
    int peek() { return arr[front]; }
    boolean isEmpty() { return size == 0; }
    public static void main(String[] args) {
        QueueArray q = new QueueArray(5);
        q.enqueue(1); q.enqueue(2); q.enqueue(3);
        System.out.println(q.dequeue()); // 1
    }
}
```

### Applications
- CPU / printer scheduling
- BFS traversal
- Order processing systems

**Space Complexity: O(n)**
