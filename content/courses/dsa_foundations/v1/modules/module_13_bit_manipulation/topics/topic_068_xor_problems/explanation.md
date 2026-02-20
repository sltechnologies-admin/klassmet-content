## XOR Problems

### Single Number (all others appear twice)

```java
static int singleNumber(int[] arr) {
    int xor = 0;
    for (int x : arr) xor ^= x;
    return xor;
}
```

### Two Non-Repeating Numbers

```java
static int[] twoSingleNumbers(int[] arr) {
    int xor = 0;
    for (int x : arr) xor ^= x;
    int bit = xor & (-xor); // lowest set bit differs between the two
    int a = 0, b = 0;
    for (int x : arr) {
        if ((x & bit) != 0) a ^= x;
        else b ^= x;
    }
    return new int[]{a, b};
}
```

**Both: Time O(n), Space O(1)**

### XOR Properties

| Property | Example |
|----------|---------|
| a ^ a = 0 | 5 ^ 5 = 0 |
| a ^ 0 = a | 5 ^ 0 = 5 |
| a ^ b ^ a = b | 3 ^ 5 ^ 3 = 5 |
| Commutative | a ^ b = b ^ a |
