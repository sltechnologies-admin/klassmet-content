## What is a Doubly Linked List?

A doubly linked list has nodes with three fields:
- **prev** — pointer to the previous node
- **data** — stored value
- **next** — pointer to the next node

### Real-time Example

A two-way road: vehicles can travel both forward and backward freely, unlike a one-way street (singly linked list).

### Node Structure

```java
class DNode {
    int data;
    DNode prev, next;
    DNode(int d) { data = d; prev = null; next = null; }
}
```

### Java Example – Doubly Linked List

```java
class DoublyLinkedList {
    DNode head;
    void insert(int data) {
        DNode n = new DNode(data);
        if (head == null) { head = n; return; }
        DNode t = head;
        while (t.next != null) t = t.next;
        t.next = n;
        n.prev = t;
    }
    void displayForward() {
        DNode t = head;
        while (t != null) { System.out.print(t.data + " "); t = t.next; }
    }
    public static void main(String[] args) {
        DoublyLinkedList dll = new DoublyLinkedList();
        dll.insert(1); dll.insert(2); dll.insert(3);
        dll.displayForward();
    }
}
```

**Time Complexity: O(n)** for traversal  
**Space Complexity: O(n)** — extra pointer per node compared to singly linked list
