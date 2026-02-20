## Topological Sort

Only valid for **Directed Acyclic Graphs (DAGs)**.

### Kahn's Algorithm (BFS-based)

1. Compute in-degree of all vertices
2. Add all 0-in-degree vertices to queue
3. Process: pop vertex, append to result, decrement neighbours' in-degrees
4. If neighbour's in-degree becomes 0, add to queue

```java
import java.util.*;
class TopologicalSort {
    static List<Integer> topoSort(int V, List<List<Integer>> adj) {
        int[] inDeg = new int[V];
        for (int u = 0; u < V; u++)
            for (int v : adj.get(u)) inDeg[v]++;
        Queue<Integer> q = new LinkedList<>();
        for (int i = 0; i < V; i++) if (inDeg[i] == 0) q.add(i);
        List<Integer> result = new ArrayList<>();
        while (!q.isEmpty()) {
            int u = q.poll();
            result.add(u);
            for (int v : adj.get(u))
                if (--inDeg[v] == 0) q.add(v);
        }
        return result;
    }
}
```

**Time: O(V + E)**  
**Space: O(V)**

### Applications
- Build order (compilers, makefiles)
- Course prerequisite scheduling
- Dependency resolution (npm, gradle)
