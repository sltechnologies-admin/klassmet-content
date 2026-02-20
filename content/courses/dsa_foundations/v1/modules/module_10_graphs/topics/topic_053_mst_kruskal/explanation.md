## Kruskal's MST Algorithm

### Steps

1. Sort all edges by weight
2. Use Union-Find (Disjoint Set Union) to track connected components
3. Add edge if it connects two different components (no cycle)
4. Stop when V-1 edges added

```java
import java.util.*;
class Kruskal {
    static int[] parent, rank;
    static int find(int x) {
        if (parent[x] != x) parent[x] = find(parent[x]);
        return parent[x];
    }
    static void union(int a, int b) {
        int ra = find(a), rb = find(b);
        if (rank[ra] < rank[rb]) parent[ra] = rb;
        else if (rank[ra] > rank[rb]) parent[rb] = ra;
        else { parent[rb] = ra; rank[ra]++; }
    }
    static int kruskal(int V, int[][] edges) {
        Arrays.sort(edges, Comparator.comparingInt(e -> e[2]));
        parent = new int[V]; rank = new int[V];
        for (int i = 0; i < V; i++) parent[i] = i;
        int cost = 0;
        for (int[] e : edges) {
            if (find(e[0]) != find(e[1])) {
                union(e[0], e[1]);
                cost += e[2];
            }
        }
        return cost;
    }
}
```

**Time: O(E log E)** — sorting edges dominates  
**Space: O(V)** — DSU parent/rank arrays
