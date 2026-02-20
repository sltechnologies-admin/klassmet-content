# Selection Sort

**Definition:** An in-place comparison sorting algorithm that selects the minimum element from the unsorted portion and places it at the correct position.

**Real-time Example:** Selecting the best student rank-wise from a list and placing them in order.

## Key Concepts
- Finds minimum in the remaining unsorted portion
- Swaps it with the first unsorted element
- In-place algorithm (no extra space needed)
- Not stable — relative order of equal elements may change

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best | O(n²) | O(1) |
| Average | O(n²) | O(1) |
| Worst | O(n²) | O(1) |

## When to Use
- When memory writes are costly (fewer swaps than bubble sort)
- Small datasets where simplicity matters more than speed
