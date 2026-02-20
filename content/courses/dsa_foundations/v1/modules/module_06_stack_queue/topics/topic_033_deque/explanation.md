## Deque – Double-Ended Queue

A deque generalises both stack and queue: insertions and deletions are allowed at **both ends**.

### Java Example using ArrayDeque

```java
import java.util.ArrayDeque;
class DequeExample {
    public static void main(String[] args) {
        ArrayDeque<Integer> dq = new ArrayDeque<>();
        dq.addFirst(1);
        dq.addLast(2);
        dq.addFirst(0);
        System.out.println(dq);          // [0, 1, 2]
        System.out.println(dq.pollFirst()); // 0
        System.out.println(dq.pollLast());  // 2
    }
}
```

### Use Cases
- Sliding window maximum (monotonic deque)
- Undo/redo with newest-first or oldest-first access
- Palindrome checking

**All operations: O(1)** amortised  
**Space: O(n)**
