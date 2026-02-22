## Tree Traversal

### DFS Traversals (Recursive)

```java
class TreeTraversal {
    static void inorder(TreeNode root) {
        if (root == null) return;
        inorder(root.left);
        System.out.print(root.data + " ");
        inorder(root.right);
    }
    static void preorder(TreeNode root) {
        if (root == null) return;
        System.out.print(root.data + " ");
        preorder(root.left);
        preorder(root.right);
    }
    static void postorder(TreeNode root) {
        if (root == null) return;
        postorder(root.left);
        postorder(root.right);
        System.out.print(root.data + " ");
    }
}
```

### Level-Order (BFS) Traversal

```java
import java.util.LinkedList;
import java.util.Queue;
class LevelOrder {
    static void levelOrder(TreeNode root) {
        if (root == null) return;
        Queue<TreeNode> q = new LinkedList<>();
        q.add(root);
        while (!q.isEmpty()) {
            TreeNode curr = q.poll();
            System.out.print(curr.data + " ");
            if (curr.left != null) q.add(curr.left);
            if (curr.right != null) q.add(curr.right);
        }
    }
}
```

| Traversal | Order | Use |
|-----------|-------|-----|
| Inorder | L → Root → R | BST sorted output |
| Preorder | Root → L → R | Copy tree |
| Postorder | L → R → Root | Delete tree |
| Level-order | Level by level | Shortest path |

**All: O(n) time, O(n) space**
