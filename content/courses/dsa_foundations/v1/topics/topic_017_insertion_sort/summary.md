# Insertion Sort

**Definition:** Builds sorted array one element at a time by inserting each element into its correct position.

**Real-time Example:** Arranging playing cards in hand - pick each card and insert it in sorted position.

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best (sorted) | O(n) | O(1) |
| Average | O(n^2) | O(1) |
| Worst (reverse) | O(n^2) | O(1) |

## When to Use
- Small arrays (under 20 elements)
- Nearly sorted data - best case O(n)
- Stable sort required