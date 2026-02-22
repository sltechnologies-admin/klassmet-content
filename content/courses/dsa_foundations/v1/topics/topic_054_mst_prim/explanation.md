## Prim's MST Algorithm

### Steps

1. Start from any vertex; key = 0, parent = -1
2. Add to priority queue; pick minimum key vertex
3. Update keys of adjacent unvisited vertices
4. Repeat until all vertices included

```java
import java.util.*;
class Prim {
    static int prim(int V, List<List<int[]>> adj) {
        int[] key = new int[V];
        boolean[] inMST = new boolean[V];
        Arrays.fill(key, Integer.MAX_VALUE);
        key[0] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>(Comparator.comparingInt(a -> a[0]));
        pq.add(new int[]{0, 0});
        int cost = 0;
        while (!pq.isEmpty()) {
            int[] cur = pq.poll();
            int u = cur[1];
            if (inMST[u]) continue;
            inMST[u] = true;
            cost += cur[0];
            for (int[] edge : adj.get(u)) {
                int v = edge[0], w = edge[1];
                if (!inMST[v] && w < key[v]) {
                    key[v] = w;
                    pq.add(new int[]{w, v});
                }
            }
        }
        return cost;
    }
}
```

**Time: O((V+E) log V)**  
**Space: O(V)**

### Kruskal vs Prim

| | Kruskal | Prim |
|---|---|---|
| Approach | Edge-based | Vertex-based |
| Best for | Sparse graphs | Dense graphs |
| Data structure | DSU | Priority queue |
