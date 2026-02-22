## Binary Search Tree (BST)

### BST Property

For every node N:
- All nodes in N's **left** subtree have values **< N**
- All nodes in N's **right** subtree have values **> N**

### Java – Insert & Search

```java
class BST {
    TreeNode root;
    TreeNode insert(TreeNode root, int val) {
        if (root == null) return new TreeNode(val);
        if (val < root.data) root.left = insert(root.left, val);
        else root.right = insert(root.right, val);
        return root;
    }
    boolean search(TreeNode root, int val) {
        if (root == null) return false;
        if (root.data == val) return true;
        if (val < root.data) return search(root.left, val);
        return search(root.right, val);
    }
    public static void main(String[] args) {
        BST tree = new BST();
        tree.root = tree.insert(tree.root, 5);
        tree.insert(tree.root, 3);
        tree.insert(tree.root, 7);
        System.out.println(tree.search(tree.root, 3)); // true
    }
}
```

| Case | Time |
|------|------|
| Balanced BST | O(log n) |
| Skewed BST | O(n) |

**Space: O(n)**
