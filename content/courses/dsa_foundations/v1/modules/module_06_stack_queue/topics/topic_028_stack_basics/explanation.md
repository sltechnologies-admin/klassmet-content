## What is a Stack?

A stack follows **LIFO** — Last In, First Out. The most recently added element is the first to be removed.

### Real-time Example

A pile of plates: you place a new plate on top and take the top plate off first.

### Core Operations

| Operation | Description | Time |
|-----------|-------------|------|
| push(x) | Add x to top | O(1) |
| pop() | Remove top | O(1) |
| peek() | View top without removing | O(1) |
| isEmpty() | Check if empty | O(1) |

### Java Example – Stack Using Array

```java
class StackArray {
    int[] arr;
    int top = -1;
    StackArray(int size) { arr = new int[size]; }
    void push(int x) { arr[++top] = x; }
    int pop() { return arr[top--]; }
    int peek() { return arr[top]; }
    boolean isEmpty() { return top == -1; }
    public static void main(String[] args) {
        StackArray s = new StackArray(5);
        s.push(1); s.push(2); s.push(3);
        System.out.println(s.pop()); // 3
        System.out.println(s.peek()); // 2
    }
}
```

### Applications
- Function call stack
- Undo/redo operations
- Bracket balancing
- Backtracking

**Space Complexity: O(n)**
