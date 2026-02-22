## What is a Hash Table?

A hash table maps **keys** to **values** using a **hash function** that converts a key into an array index.

### Real-time Example

Locker room: your locker number is derived from your employee ID (hash function). You can find your locker directly rather than searching every locker.

### Hash Function

```
index = key % table_size
```

### Java Example – HashMap

```java
import java.util.HashMap;
class HashTableExample {
    public static void main(String[] args) {
        HashMap<String, Integer> map = new HashMap<>();
        map.put("Alice", 90);
        map.put("Bob", 85);
        System.out.println(map.get("Alice")); // 90
        System.out.println(map.containsKey("Bob")); // true
        map.remove("Bob");
    }
}
```

| Operation | Avg Time | Worst Time |
|-----------|----------|------------|
| put | O(1) | O(n) |
| get | O(1) | O(n) |
| remove | O(1) | O(n) |
| containsKey | O(1) | O(n) |

**Space Complexity: O(n)**
