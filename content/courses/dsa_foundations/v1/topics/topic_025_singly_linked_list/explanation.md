## What is a Singly Linked List?

A singly linked list is a chain of **nodes**, where each node contains:
- **data** — the stored value
- **next** — a reference to the next node (null at tail)

### Real-time Example

Treasure hunt: each clue tells you where to find the next clue. Following the chain from head to tail gives you all the clues in order.

### Node Structure

```java
class Node {
    int data;
    Node next;
    Node(int d) { data = d; next = null; }
}
```

### Java Example – Singly Linked List

```java
class SinglyLinkedList {
    Node head;
    void insert(int data) {
        Node n = new Node(data);
        if (head == null) { head = n; return; }
        Node t = head;
        while (t.next != null) t = t.next;
        t.next = n;
    }
    void display() {
        Node t = head;
        while (t != null) { System.out.print(t.data + " "); t = t.next; }
    }
    public static void main(String[] args) {
        SinglyLinkedList ll = new SinglyLinkedList();
        ll.insert(1); ll.insert(2); ll.insert(3);
        ll.display();
    }
}
```

| Operation | Time Complexity |
|-----------|----------------|
| Insert at tail | O(n) |
| Insert at head | O(1) |
| Delete | O(n) |
| Search | O(n) |
| Access by index | O(n) |

**Space Complexity: O(n)**
