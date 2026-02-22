## Collision Resolution Techniques

### 1. Separate Chaining

Each bucket holds a linked list of all keys that hash to that index.

```
index 2 → [key: "Alice"] → [key: "Charlie"] → null
```

Java's `HashMap` uses separate chaining internally.

### 2. Open Addressing – Linear Probing

If bucket at `h(k)` is occupied, try `h(k)+1`, `h(k)+2`, etc.

```java
class LinearProbingHash {
    int[] keys;
    int size;
    LinearProbingHash(int size) { this.size = size; keys = new int[size]; java.util.Arrays.fill(keys, -1); }
    void insert(int key) {
        int idx = key % size;
        while (keys[idx] != -1) idx = (idx + 1) % size;
        keys[idx] = key;
    }
    boolean search(int key) {
        int idx = key % size;
        while (keys[idx] != -1) {
            if (keys[idx] == key) return true;
            idx = (idx + 1) % size;
        }
        return false;
    }
}
```

| Technique | Avg Search | Worst Search |
|-----------|-----------|--------------|
| Separate chaining | O(1) | O(n) |
| Linear probing | O(1) | O(n) |
