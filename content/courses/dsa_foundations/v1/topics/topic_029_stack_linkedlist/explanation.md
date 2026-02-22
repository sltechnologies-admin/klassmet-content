## Stack Using Linked List

When a stack is built with a linked list, the head of the list acts as the top of the stack. This approach has no fixed size limit (unlike arrays).

```java
class StackLinkedList {
    Node top = null;
    void push(int x) {
        Node n = new Node(x);
        n.next = top;
        top = n;
    }
    int pop() {
        int val = top.data;
        top = top.next;
        return val;
    }
    int peek() { return top.data; }
    boolean isEmpty() { return top == null; }
}
```

| Operation | Time | Space |
|-----------|------|-------|
| push | O(1) | O(1) |
| pop | O(1) | O(1) |
| peek | O(1) | O(1) |

**Total Space Complexity: O(n)**
