## Binary Tree

A binary tree consists of nodes where each node has:
- **left** – left child (or null)
- **right** – right child (or null)
- **data** – stored value

### Terminology

| Term | Meaning |
|------|---------|
| Root | Topmost node |
| Leaf | Node with no children |
| Height | Longest path root → leaf |
| Depth | Distance from root to node |
| Parent | Node directly above |

### Java Node Structure

```java
class TreeNode {
    int data;
    TreeNode left, right;
    TreeNode(int d) { data = d; left = null; right = null; }
}
class BinaryTree {
    TreeNode root;
    public static void main(String[] args) {
        BinaryTree tree = new BinaryTree();
        tree.root = new TreeNode(1);
        tree.root.left = new TreeNode(2);
        tree.root.right = new TreeNode(3);
        tree.root.left.left = new TreeNode(4);
    }
}
```

### Tree Types

| Type | Property |
|------|----------|
| Full | Every node has 0 or 2 children |
| Complete | All levels full except possibly last |
| Perfect | All internal nodes have 2 children, all leaves at same level |
