## Dijkstra's Shortest Path Algorithm

### Algorithm

1. Initialize distances: source = 0, others = ∞
2. Use a min-heap (priority queue) ordered by distance
3. Pop minimum-distance vertex, relax neighbours
4. Repeat until heap is empty

```java
import java.util.*;
class Dijkstra {
    static int[] dijkstra(List<List<int[]>> adj, int src, int V) {
        int[] dist = new int[V];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>(Comparator.comparingInt(a -> a[0]));
        pq.add(new int[]{0, src});
        while (!pq.isEmpty()) {
            int[] cur = pq.poll();
            int d = cur[0], u = cur[1];
            if (d > dist[u]) continue;
            for (int[] edge : adj.get(u)) {
                int v = edge[0], w = edge[1];
                if (dist[u] + w < dist[v]) {
                    dist[v] = dist[u] + w;
                    pq.add(new int[]{dist[v], v});
                }
            }
        }
        return dist;
    }
}
```

**Time: O((V+E) log V)** — PQ operations  
**Space: O(V)** — distance array + PQ  
**Limitation: does NOT work with negative weights**
