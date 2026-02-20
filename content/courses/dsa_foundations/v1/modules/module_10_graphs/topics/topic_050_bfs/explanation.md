## BFS – Breadth-First Search

BFS uses a **Queue (FIFO)** to visit nodes level by level.

```java
import java.util.*;
class BFS {
    static void bfs(List<List<Integer>> adj, int start, int V) {
        boolean[] visited = new boolean[V];
        Queue<Integer> q = new LinkedList<>();
        visited[start] = true;
        q.add(start);
        while (!q.isEmpty()) {
            int node = q.poll();
            System.out.print(node + " ");
            for (int nb : adj.get(node)) {
                if (!visited[nb]) {
                    visited[nb] = true;
                    q.add(nb);
                }
            }
        }
    }
}
```

**Time: O(V + E)** — each vertex and edge visited once  
**Space: O(V)** — visited array + queue

### Applications
- Shortest path in unweighted graphs
- Level order traversal
- Connected components
