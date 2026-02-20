## Graph Representations

### Adjacency Matrix

2D boolean array `adj[V][V]` where `adj[i][j] = true` if edge i→j exists.

```java
int V = 4;
int[][] adj = new int[V][V];
adj[0][1] = 1; adj[1][2] = 1; adj[2][3] = 1; adj[3][0] = 1;
```

**Space: O(V²)** | Check edge: O(1) | Find all neighbours: O(V)

### Adjacency List

Array of lists where `adj[i]` holds all neighbours of vertex i.

```java
import java.util.*;
class Graph {
    int V;
    List<List<Integer>> adj;
    Graph(int v) {
        V = v;
        adj = new ArrayList<>();
        for (int i = 0; i < v; i++) adj.add(new ArrayList<>());
    }
    void addEdge(int u, int v) {
        adj.get(u).add(v);
        adj.get(v).add(u); // undirected
    }
}
```

**Space: O(V+E)** | Check edge: O(degree) | Find neighbours: O(degree)

| | Matrix | List |
|---|---|---|
| Space | O(V²) | O(V+E) |
| Add edge | O(1) | O(1) |
| Check edge | O(1) | O(degree) |
| All neighbours | O(V) | O(degree) |
