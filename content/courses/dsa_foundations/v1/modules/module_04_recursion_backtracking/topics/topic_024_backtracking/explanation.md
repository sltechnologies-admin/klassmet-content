## What is Backtracking?

Backtracking tries **all possibilities** and **undoes choices** when they fail, exploring the complete solution space.

### Real-time Example

Solving a maze:
1. Move forward
2. Hit a dead end → backtrack to previous position
3. Try another direction
4. Repeat until exit is found

### Pattern: Try → Check → Backtrack

```
choose option
  recurse
  if failed → undo choice (backtrack)
```

### Java Example – Print All Binary Strings of Length n

```java
class BacktrackingExample {
    static void generate(int n, String s) {
        if (n == 0) {
            System.out.println(s);
            return;
        }
        generate(n - 1, s + "0");
        generate(n - 1, s + "1");
    }
    public static void main(String[] args) {
        generate(3, "");
    }
}
```

**Time Complexity: O(2ⁿ)**  
**Space Complexity: O(n)**

### Java Example – String Permutations

```java
class Permutations {
    static void permute(String s, String ans) {
        if (s.length() == 0) {
            System.out.println(ans);
            return;
        }
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            String left = s.substring(0, i);
            String right = s.substring(i + 1);
            permute(left + right, ans + ch);
        }
    }
    public static void main(String[] args) {
        permute("ABC", "");
    }
}
```

**Time Complexity: O(n!)**  
**Space Complexity: O(n)**
