## HashSet

A `HashSet` stores only keys (no values) and guarantees uniqueness. Internally it is a `HashMap` with a constant dummy value.

### Java Example

```java
import java.util.HashSet;
class HashSetExample {
    public static void main(String[] args) {
        HashSet<Integer> set = new HashSet<>();
        set.add(1); set.add(2); set.add(2); set.add(3);
        System.out.println(set.size());       // 3 (duplicate ignored)
        System.out.println(set.contains(2));  // true
        set.remove(2);
        System.out.println(set);              // [1, 3]
    }
}
```

**Use cases**: removing duplicates, checking membership, finding intersection/union of two arrays.

**All operations: O(1) average, O(n) worst case**
