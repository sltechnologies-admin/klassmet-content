## DFS – Depth-First Search

DFS goes deep into one path before backing up to try another.

```java
import java.util.*;
class DFS {
    static void dfs(List<List<Integer>> adj, int node, boolean[] visited) {
        visited[node] = true;
        System.out.print(node + " ");
        for (int nb : adj.get(node)) {
            if (!visited[nb]) dfs(adj, nb, visited);
        }
    }
    public static void main(String[] args) {
        int V = 4;
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < V; i++) adj.add(new ArrayList<>());
        adj.get(0).add(1); adj.get(0).add(2);
        adj.get(1).add(3); adj.get(2).add(3);
        boolean[] visited = new boolean[V];
        dfs(adj, 0, visited);
    }
}
```

**Time: O(V + E)** — each vertex and edge visited once  
**Space: O(V)** — recursion call stack + visited array

### Applications
- Cycle detection in directed/undirected graphs
- Topological sorting
- Connected components
- Maze solving
