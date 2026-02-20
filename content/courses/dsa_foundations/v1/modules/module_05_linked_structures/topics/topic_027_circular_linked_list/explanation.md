## Circular Linked List

The tail of a circular linked list points back to the head — there is no null terminator. Good for round-robin scheduling.

### Real-time Example

A round-robin game: players take turns in a circle. After the last player takes a turn, it wraps around to the first player again.

### Java – Circular LL Display

```java
class CircularLinkedList {
    Node head;
    void insert(int data) {
        Node n = new Node(data);
        if (head == null) { head = n; n.next = head; return; }
        Node t = head;
        while (t.next != head) t = t.next;
        t.next = n; n.next = head;
    }
    void display() {
        if (head == null) return;
        Node t = head;
        do {
            System.out.print(t.data + " ");
            t = t.next;
        } while (t != head);
    }
}
```

## Reverse a Linked List

```java
class ReverseLinkedList {
    static Node reverse(Node head) {
        Node prev = null, curr = head, next = null;
        while (curr != null) {
            next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }
        return prev;
    }
}
```

**Time: O(n), Space: O(1)**

## Floyd's Cycle Detection

Uses slow (1 step) and fast (2 steps) pointers. If they meet, a cycle exists.

```java
class CycleDetection {
    static boolean hasCycle(Node head) {
        Node slow = head, fast = head;
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            if (slow == fast) return true;
        }
        return false;
    }
}
```

**Time: O(n), Space: O(1)**
