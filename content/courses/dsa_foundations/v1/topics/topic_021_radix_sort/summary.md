# Radix Sort

**Definition:** Sort integers by processing one digit at a time, from least significant to most significant, using counting sort as subroutine.

**Real-time Example:** Sorting postal codes digit by digit from right to left.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(d*(n+k)) | O(n+k) |

d = number of digits, k = 10 (decimal base)

## When to Use
- Sorting integers with fixed number of digits
- When d is small constant (like 32-bit integers)