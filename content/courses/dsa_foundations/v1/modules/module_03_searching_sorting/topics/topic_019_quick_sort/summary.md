# Quick Sort

**Definition:** Select a pivot, partition elements (smaller left, larger right), recursively sort partitions.

**Real-time Example:** Seating arrangement - people shorter than pivot person seated on left, taller on right.

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best/Average | O(n log n) | O(log n) |
| Worst (sorted) | O(n^2) | O(n) |

## Key Properties
- In-place (no extra array)
- Not stable
- Faster than merge sort in practice (better cache performance)