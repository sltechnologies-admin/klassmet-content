## Monotonic Stack

A monotonic stack maintains relative order (all increasing or all decreasing) by popping elements that violate the invariant as new elements arrive.

### Next Greater Element

```java
import java.util.Stack;
class MonotonicStack {
    static int[] nextGreater(int[] arr) {
        int n = arr.length;
        int[] result = new int[n];
        Stack<Integer> st = new Stack<>();
        for (int i = n - 1; i >= 0; i--) {
            while (!st.isEmpty() && st.peek() <= arr[i]) st.pop();
            result[i] = st.isEmpty() ? -1 : st.peek();
            st.push(arr[i]);
        }
        return result;
    }
    public static void main(String[] args) {
        int[] arr = {4, 5, 2, 10};
        int[] res = nextGreater(arr);
        for (int x : res) System.out.print(x + " "); // 5 10 10 -1
    }
}
```

**Time Complexity: O(n)** — each element pushed and popped at most once  
**Space Complexity: O(n)**
