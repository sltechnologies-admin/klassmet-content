## Load Factor

$$\text{Load Factor} = \frac{\text{n (entries)}}{\text{k (buckets)}}$$

Java's `HashMap` default load factor is **0.75**. When the load factor exceeds 0.75, the table **doubles its capacity** and rehashes all keys.

### Why It Matters

| Load Factor | Collisions | Performance |
|-------------|-----------|-------------|
| Low (< 0.5) | Fewer | Fast, more memory |
| High (> 0.9) | More | Slower, less memory |

### Rehashing Process (Java HashMap)

1. New array of size `2 × old_size` is created
2. Each element is re-hashed into the new array
3. Old array is garbage collected

**Amortised cost remains O(1) per insertion** despite rehashing.
