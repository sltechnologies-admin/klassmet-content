## Trie (Prefix Tree)

Each node stores an array of 26 child pointers (lowercase letters) and a boolean `isEnd`.

```java
class Trie {
    TrieNode root = new TrieNode();
    static class TrieNode {
        TrieNode[] children = new TrieNode[26];
        boolean isEnd;
    }
    void insert(String word) {
        TrieNode node = root;
        for (char c : word.toCharArray()) {
            int idx = c - 'a';
            if (node.children[idx] == null) node.children[idx] = new TrieNode();
            node = node.children[idx];
        }
        node.isEnd = true;
    }
    boolean search(String word) {
        TrieNode node = root;
        for (char c : word.toCharArray()) {
            int idx = c - 'a';
            if (node.children[idx] == null) return false;
            node = node.children[idx];
        }
        return node.isEnd;
    }
    boolean startsWith(String prefix) {
        TrieNode node = root;
        for (char c : prefix.toCharArray()) {
            int idx = c - 'a';
            if (node.children[idx] == null) return false;
            node = node.children[idx];
        }
        return true;
    }
}
```

**Time: O(L) per operation** (L = word/prefix length)  
**Space: O(total characters × 26)**

### Applications
- Autocomplete / typeahead
- Spell checker
- IP routing (compressed tries)
- Word search puzzles (DFS on trie)
