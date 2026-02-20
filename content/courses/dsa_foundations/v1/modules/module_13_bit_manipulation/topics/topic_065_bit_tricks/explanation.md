## Bit Tricks

### Power of 2

```java
static boolean isPowerOf2(int n) { return n > 0 && (n & (n - 1)) == 0; }
```

### Count Set Bits (Brian Kernighan)

Each `n &= (n-1)` clears the lowest set bit.

```java
static int countBits(int n) {
    int count = 0;
    while (n != 0) { n &= (n - 1); count++; }
    return count;
}
```

**Time: O(number of set bits)** — best O(1), worst O(log n)

### Lowest Set Bit

```java
static int lowestSetBit(int n) { return n & (-n); }
```

### XOR Find Missing Number

XOR all 1..n with all array elements — duplicates cancel out:

```java
static int findMissing(int[] arr, int n) {
    int xor = 0;
    for (int i = 1; i <= n; i++) xor ^= i;
    for (int x : arr) xor ^= x;
    return xor;
}
```

**Time: O(n), Space: O(1)**
