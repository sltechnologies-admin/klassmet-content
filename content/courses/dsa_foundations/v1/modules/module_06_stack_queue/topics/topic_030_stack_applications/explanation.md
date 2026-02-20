## Stack Applications

### 1. Bracket Balancing

```java
class BracketChecker {
    static boolean isBalanced(String s) {
        java.util.Stack<Character> st = new java.util.Stack<>();
        for (char c : s.toCharArray()) {
            if (c == '(' || c == '[' || c == '{') st.push(c);
            else {
                if (st.isEmpty()) return false;
                char top = st.pop();
                if (c == ')' && top != '(') return false;
                if (c == ']' && top != '[') return false;
                if (c == '}' && top != '{') return false;
            }
        }
        return st.isEmpty();
    }
    public static void main(String[] args) {
        System.out.println(isBalanced("({[]})")); // true
    }
}
```

### 2. Infix to Postfix

Push operators onto stack; pop when higher/equal precedence encountered.

### Real-time Use Cases

| Use Case | Explanation |
|----------|-------------|
| Browser back button | Visited pages pushed; back pops |
| Function call stack | Call frames pushed/popped at return |
| DFS traversal | Nodes pushed and explored LIFO |
| Undo/Redo | Each action pushed, undo pops |
