## Segment Tree

A segment tree divides an array into segments and stores aggregate results (e.g. sum) at each internal node.

```
arr = [1, 3, 5, 7, 9, 11]
tree[1] = sum(0..5) = 36
tree[2] = sum(0..2) = 9
tree[3] = sum(3..5) = 27
...
```

### Java – Build, Query, Update

```java
class SegmentTree {
    int[] tree;
    int n;
    SegmentTree(int[] arr) {
        n = arr.length;
        tree = new int[4 * n];
        build(arr, 0, n - 1, 1);
    }
    void build(int[] arr, int l, int r, int node) {
        if (l == r) { tree[node] = arr[l]; return; }
        int mid = (l + r) / 2;
        build(arr, l, mid, 2 * node);
        build(arr, mid + 1, r, 2 * node + 1);
        tree[node] = tree[2 * node] + tree[2 * node + 1];
    }
    int query(int l, int r, int ql, int qr, int node) {
        if (qr < l || r < ql) return 0;
        if (ql <= l && r <= qr) return tree[node];
        int mid = (l + r) / 2;
        return query(l, mid, ql, qr, 2 * node) + query(mid + 1, r, ql, qr, 2 * node + 1);
    }
}
```

**Build: O(n), Query: O(log n), Update: O(log n)**  
**Space: O(n)**
