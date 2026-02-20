## Disjoint Set Union (DSU / Union-Find)

### Structure

Each element has a `parent` (points to root of its set) and a `rank` (tree height estimate).

```java
class DSU {
    int[] parent, rank;
    DSU(int n) {
        parent = new int[n]; rank = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
    }
    int find(int x) {
        if (parent[x] != x) parent[x] = find(parent[x]); // path compression
        return parent[x];
    }
    void union(int a, int b) {
        int ra = find(a), rb = find(b);
        if (ra == rb) return; // already same set
        if (rank[ra] < rank[rb]) parent[ra] = rb;
        else if (rank[ra] > rank[rb]) parent[rb] = ra;
        else { parent[rb] = ra; rank[ra]++; }
    }
    boolean connected(int a, int b) { return find(a) == find(b); }
}
```

**Time: near O(1) amortised** with path compression + union by rank (technically O(α(n)) where α is inverse Ackermann)  
**Space: O(n)**

### Applications
- Kruskal's MST
- Cycle detection
- Number of connected components
- Dynamic connectivity
