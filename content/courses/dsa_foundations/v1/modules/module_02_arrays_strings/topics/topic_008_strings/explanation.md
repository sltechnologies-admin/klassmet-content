## What is a String?

A String is a **sequence of characters** and is **immutable** in Java.

### Real-time Example

Usernames, passwords, and messages are all everyday strings:
- `"Alice"` — username
- `"Pass@123"` — password
- `"Hello!"` — message

### Immutability

Once created, a Java String **cannot be modified**. Any operation creates a new String object.

```java
class StringExample {
    public static void main(String[] args) {
        String s = "DSA";
        System.out.println(s.length());   // 3
        System.out.println(s.charAt(1));  // S
    }
}
```

**Time Complexity: O(n)** for traversal  
**Space Complexity: O(n)**

### Palindrome

A palindrome reads the same forwards and backwards: `"madam"`, `"racecar"`.

### Anagram

Two strings are anagrams if they have the **same characters in any order**: `"listen"` and `"silent"`.

### ASCII

ASCII is a character encoding standard that assigns numeric values to characters (A=65, a=97, 0=48, etc.).
