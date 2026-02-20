## Bit Manipulation Basics

### Operators

| Operator | Symbol | Example (5=101, 3=011) |
|----------|--------|------------------------|
| AND | `&` | 5 & 3 = 001 = 1 |
| OR | `\|` | 5 \| 3 = 111 = 7 |
| XOR | `^` | 5 ^ 3 = 110 = 6 |
| NOT | `~` | ~5 = -6 (two's complement) |
| Left shift | `<<` | 5 << 1 = 10 (×2) |
| Right shift | `>>` | 5 >> 1 = 2 (÷2) |

### Common Tricks

```java
class BitTricks {
    static boolean isOdd(int n) { return (n & 1) == 1; }
    static boolean isPowerOf2(int n) { return n > 0 && (n & (n - 1)) == 0; }
    static int setBit(int n, int i) { return n | (1 << i); }
    static int clearBit(int n, int i) { return n & ~(1 << i); }
    static int toggleBit(int n, int i) { return n ^ (1 << i); }
    static boolean checkBit(int n, int i) { return (n >> i & 1) == 1; }
    public static void main(String[] args) {
        System.out.println(isOdd(5));            // true
        System.out.println(isPowerOf2(8));       // true
        System.out.println(setBit(5, 1));        // 7  (101 | 010 = 111)
    }
}
```
