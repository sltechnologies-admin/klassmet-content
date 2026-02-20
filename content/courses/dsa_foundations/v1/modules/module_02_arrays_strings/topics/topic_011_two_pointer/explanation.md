## What is the Two-Pointer Technique?

The two-pointer technique uses **two indices** moving through a data structure to solve problems more efficiently.

### Real-time Example

Two people walking toward each other through a tunnel:
- One starts at entrance (left pointer)
- One starts at exit (right pointer)
- They move toward each other until they meet
- Together they cover the tunnel in O(n/2) ≈ O(n)

### When to Use

- Sorted arrays: find pairs with target sum
- Reverse a string/array in place
- Find palindrome
- Merge sorted arrays

### Java Example – Find Pair with Target Sum

```java
class TwoPointer {
    static boolean hasPair(int[] arr, int target) {
        int left = 0, right = arr.length - 1;
        while (left < right) {
            int sum = arr[left] + arr[right];
            if (sum == target) return true;
            else if (sum < target) left++;
            else right--;
        }
        return false;
    }
    public static void main(String[] args) {
        int[] arr = {1, 2, 4, 7, 11};
        System.out.println(hasPair(arr, 9));
    }
}
```

**Time Complexity: O(n)**  
**Space Complexity: O(1)**
