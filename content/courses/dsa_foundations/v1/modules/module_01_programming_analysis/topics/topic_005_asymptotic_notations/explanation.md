## What are Asymptotic Notations?

Asymptotic notations describe algorithm growth rates — they tell us how fast or slow an algorithm is as input size `n` grows towards infinity.

### Real-time Example

Comparing fuel consumption of vehicles:
- A car might give **worst case** 8 km/litre in city traffic (Big-O)
- **Best case** 15 km/litre on highway (Omega)
- **Average case** 11 km/litre typically (Theta)

### The Three Notations

| Notation | Symbol | Represents | Meaning |
|----------|--------|-----------|---------|
| Big-O | O | Worst case | Upper bound on growth |
| Big-Omega | Ω | Best case | Lower bound on growth |
| Big-Theta | Θ | Average case | Tight bound (both upper and lower) |

### Big-O (Most Used)

Big-O defines the **worst-case** upper bound:

> If f(n) = O(g(n)), then f grows no faster than g.

### Java Example – Linear Search

```java
class AsymptoticExample {
    static int linearSearch(int[] arr, int key) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == key)
                return i;
        }
        return -1;
    }
    public static void main(String[] args) {
        int[] arr = {4, 2, 7, 1};
        System.out.println(linearSearch(arr, 7));
    }
}
```

- **Best case** → Ω(1) — element found at first position
- **Worst case** → O(n) — element at last position or not found
- **Average case** → Θ(n) — element found somewhere in the middle

### Which notation is most commonly used?

**Big-O** — because we usually care about the worst-case performance when designing systems.
