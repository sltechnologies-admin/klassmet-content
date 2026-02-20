## AVL Tree

An AVL tree maintains balance after each insert/delete by performing **rotations** when a node's balance factor falls outside $[-1, 1]$.

$$\text{Balance Factor} = h(\text{left}) - h(\text{right})$$

### Rotation Types

| Case | Rotation |
|------|----------|
| Left-Left (LL) | Right rotation |
| Right-Right (RR) | Left rotation |
| Left-Right (LR) | Left rotation on left child, then right rotation |
| Right-Left (RL) | Right rotation on right child, then left rotation |

### Key Properties

- Height: O(log n) always maintained
- Search, Insert, Delete: **O(log n)** guaranteed
- Extra cost: height tracking and rotation logic per insert

### Significance vs BST

A plain BST degrades to O(n) on sorted input. AVL guarantees O(log n) in all cases by rebalancing.
