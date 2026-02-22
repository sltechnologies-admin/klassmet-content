## Bit Manipulation Applications

### XOR Swap

```java
static void swap(int[] arr, int i, int j) {
    arr[i] ^= arr[j];
    arr[j] ^= arr[i];
    arr[i] ^= arr[j];
}
```

### Multiply/Divide by Powers of 2

```java
int x = 5;
int times2 = x << 1;  // 10
int div4   = x >> 2;  // 1
```

### Reverse Bits

```java
static int reverseBits(int n) {
    int result = 0;
    for (int i = 0; i < 32; i++) {
        result = (result << 1) | (n & 1);
        n >>= 1;
    }
    return result;
}
```

### Applications Table

| Task | Bit Operation |
|------|--------------|
| Multiply by 2 | `n << 1` |
| Divide by 2 | `n >> 1` |
| Check power of 2 | `n & (n-1) == 0` |
| Find odd | `n & 1` |
| Swap without temp | XOR swap |
