## Hashing Applications

### 1. Two Sum – O(n)

```java
import java.util.HashMap;
class TwoSum {
    static int[] twoSum(int[] nums, int target) {
        HashMap<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];
            if (map.containsKey(complement))
                return new int[]{map.get(complement), i};
            map.put(nums[i], i);
        }
        return new int[]{};
    }
}
```

### 2. Anagram Check – O(n)

```java
import java.util.HashMap;
class AnagramCheck {
    static boolean isAnagram(String a, String b) {
        if (a.length() != b.length()) return false;
        HashMap<Character, Integer> freq = new HashMap<>();
        for (char c : a.toCharArray()) freq.merge(c, 1, Integer::sum);
        for (char c : b.toCharArray()) {
            freq.merge(c, -1, Integer::sum);
            if (freq.get(c) < 0) return false;
        }
        return true;
    }
}
```

Both solutions run in **O(n) time, O(n) space**.
