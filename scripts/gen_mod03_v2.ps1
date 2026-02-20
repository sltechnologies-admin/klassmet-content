$base = "e:\sltechs\100_sourcecode\100_klassmet_UI\klassmet-content\content\courses\dsa_foundations\v1\modules"

function W($path, $content) {
    $dir = Split-Path $path
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
}

# ===================== topic_017_insertion_sort =====================
$t = "$base\module_03_searching_sorting\topics\topic_017_insertion_sort"
W "$t\topic.json" '{
  "topicId": "topic_017_insertion_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Insertion Sort",
  "slug": "insertion-sort",
  "order": 6,
  "estimatedMinutes": 20,
  "difficulty": "beginner",
  "tags": ["insertion sort","sorting","comparison","cards"],
  "prerequisites": ["topic_016_selection_sort"],
  "learningObjectives": ["Understand insertion sort","Analyze best case O(n)","Implement in Java","Identify use cases"],
  "status": "active"
}'
$s = @'
# Insertion Sort

**Definition:** Builds sorted array one element at a time by inserting each element into its correct position.

**Real-time Example:** Arranging playing cards in hand - pick each card and insert it in sorted position.

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best (sorted) | O(n) | O(1) |
| Average | O(n^2) | O(1) |
| Worst (reverse) | O(n^2) | O(1) |

## When to Use
- Small arrays (under 20 elements)
- Nearly sorted data - best case O(n)
- Stable sort required
'@
W "$t\summary.md" $s
$e = @'
# Insertion Sort - In-Depth Explanation

## How It Works
Take each element (key) and insert into correct position in already-sorted left portion.

Example: [12, 11, 13, 5, 6]
- i=1: key=11, shift 12 right -> [11, 12, 13, 5, 6]
- i=2: key=13, no shift -> [11, 12, 13, 5, 6]
- i=3: key=5, shift 13,12,11 -> [5, 11, 12, 13, 6]
- i=4: key=6, shift 13,12,11 -> [5, 6, 11, 12, 13]

## Java Implementation

```java
class InsertionSort {
    static void insertionSort(int[] arr) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
    public static void main(String[] args) {
        int[] arr = {12, 11, 13, 5, 6};
        insertionSort(arr);
        for (int x : arr) System.out.print(x + " "); // Output: 5 6 11 12 13
    }
}
```

## Key Points
- Stable algorithm: preserves relative order of equal elements
- Adaptive: faster on nearly sorted input
- Online: can process elements as they arrive
- In-place: O(1) extra space
'@
W "$t\explanation.md" $e
W "$t\examples.json" '{
  "topicId": "topic_017_insertion_sort",
  "examples": [
    {
      "id": "ex_insertion_sort",
      "title": "Insertion Sort",
      "language": "java",
      "description": "Sort array by inserting each element into sorted portion",
      "code": "class InsertionSort {\n    static void insertionSort(int[] arr) {\n        int n = arr.length;\n        for (int i = 1; i < n; i++) {\n            int key = arr[i]; int j = i - 1;\n            while (j >= 0 && arr[j] > key) { arr[j+1] = arr[j]; j--; }\n            arr[j+1] = key;\n        }\n    }\n    public static void main(String[] args) {\n        int[] arr = {12,11,13,5,6};\n        insertionSort(arr);\n        for (int x : arr) System.out.print(x + \" \");\n    }\n}",
      "output": "5 6 11 12 13",
      "complexity": {"time": "O(n^2) worst, O(n) best", "space": "O(1)"},
      "explanation": "Shifts elements right to make room for key. Best case O(n) for sorted input."
    }
  ]
}'
W "$t\questions.json" '{
  "topicId": "topic_017_insertion_sort",
  "questions": [
    {
      "id": "q_017_best_case",
      "type": "mcq",
      "difficulty": "beginner",
      "question": "Insertion sort best case time complexity is",
      "options": ["O(n^2)", "O(n log n)", "O(n)", "O(1)"],
      "correctAnswer": 2,
      "explanation": "When already sorted, inner while loop runs 0 times each iteration, giving O(n) total comparisons."
    }
  ]
}'
W "$t\practice.json" '{
  "topicId": "topic_017_insertion_sort",
  "problems": [
    {
      "id": "pp_insertion_binary",
      "title": "Insertion Sort with Binary Search",
      "difficulty": "intermediate",
      "description": "Use binary search to find insertion position. Count total element shifts.",
      "hints": ["Binary search gives O(log n) comparisons per element", "Shifting is still O(n) per element"],
      "solution": {"approach": "Binary search for position then System.arraycopy to shift", "complexity": {"time": "O(n^2)", "space": "O(1)"}}
    }
  ]
}'
Write-Host "topic_017 done"

# ===================== topic_018_merge_sort =====================
$t = "$base\module_03_searching_sorting\topics\topic_018_merge_sort"
W "$t\topic.json" '{
  "topicId": "topic_018_merge_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Merge Sort",
  "slug": "merge-sort",
  "order": 7,
  "estimatedMinutes": 30,
  "difficulty": "intermediate",
  "tags": ["merge sort","divide conquer","stable","O(n log n)"],
  "prerequisites": ["topic_017_insertion_sort"],
  "learningObjectives": ["Understand divide and conquer","Implement merge step","Guarantee O(n log n)","Count inversions"],
  "status": "active"
}'
$s = @'
# Merge Sort

**Definition:** Divide array into halves, recursively sort each half, then merge sorted halves.

**Real-time Example:** Merging sorted exam results from multiple school classes into one ranked list.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(n log n) | O(n) |

## Key Advantages
- Guaranteed O(n log n) - no worst case degradation
- Stable sorting algorithm
- Best choice for linked lists (no random access needed)
'@
W "$t\summary.md" $s
$e = @'
# Merge Sort - In-Depth Explanation

## Divide and Conquer Strategy
1. Divide: Split array into two halves
2. Conquer: Recursively sort each half
3. Combine: Merge the two sorted halves

## Recursion Tree for [38,27,43,3]
```
         [38,27,43,3]
        /            \
   [38,27]          [43,3]
   /     \          /    \
 [38]   [27]     [43]   [3]
   \     /          \   /
  [27,38]          [3,43]
        \          /
       [3,27,38,43]
```

## Java Implementation

```java
class MergeSort {
    static void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1, n2 = r - m;
        int[] L = new int[n1], R = new int[n2];
        for (int i = 0; i < n1; i++) L[i] = arr[l + i];
        for (int j = 0; j < n2; j++) R[j] = arr[m + 1 + j];
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2)
            arr[k++] = (L[i] <= R[j]) ? L[i++] : R[j++];
        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
    static void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = (l + r) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }
    public static void main(String[] args) {
        int[] arr = {38, 27, 43, 3, 9, 82, 10};
        mergeSort(arr, 0, arr.length - 1);
        for (int x : arr) System.out.print(x + " ");
        // Output: 3 9 10 27 38 43 82
    }
}
```
'@
W "$t\explanation.md" $e
W "$t\examples.json" '{
  "topicId": "topic_018_merge_sort",
  "examples": [
    {
      "id": "ex_merge_sort",
      "title": "Merge Sort Full Implementation",
      "language": "java",
      "description": "Recursive divide and conquer with merge step",
      "code": "class MergeSort {\n    static void merge(int[] arr,int l,int m,int r) {\n        int n1=m-l+1,n2=r-m;\n        int[] L=new int[n1],R=new int[n2];\n        for(int i=0;i<n1;i++) L[i]=arr[l+i];\n        for(int j=0;j<n2;j++) R[j]=arr[m+1+j];\n        int i=0,j=0,k=l;\n        while(i<n1 && j<n2) arr[k++]=(L[i]<=R[j])?L[i++]:R[j++];\n        while(i<n1) arr[k++]=L[i++];\n        while(j<n2) arr[k++]=R[j++];\n    }\n    static void mergeSort(int[] arr,int l,int r) {\n        if(l<r){int m=(l+r)/2;mergeSort(arr,l,m);mergeSort(arr,m+1,r);merge(arr,l,m,r);}\n    }\n}",
      "output": "3 9 10 27 38 43 82",
      "complexity": {"time": "O(n log n)", "space": "O(n)"},
      "explanation": "Splits recursively, merges in sorted order. Stable. No worst case."
    }
  ]
}'
W "$t\questions.json" '{
  "topicId": "topic_018_merge_sort",
  "questions": [
    {
      "id": "q_024_merge_sort_technique",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Merge sort uses",
      "options": ["Greedy", "Backtracking", "Divide and conquer", "DP"],
      "correctAnswer": 2,
      "explanation": "Merge sort recursively divides the array into halves and merges sorted halves - classic divide and conquer."
    },
    {
      "id": "q_025_merge_sort_space",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Merge sort space complexity",
      "options": ["O(1)", "O(log n)", "O(n)", "O(n^2)"],
      "correctAnswer": 2,
      "explanation": "Merge sort requires O(n) auxiliary space for temporary arrays used in the merge step."
    }
  ]
}'
W "$t\practice.json" '{
  "topicId": "topic_018_merge_sort",
  "problems": [
    {
      "id": "pp_count_inversions",
      "title": "Count Inversions Using Merge Sort",
      "difficulty": "intermediate",
      "description": "Count pairs (i,j) where i < j but arr[i] > arr[j] using modified merge sort.",
      "hints": ["Count inversions in merge step when right element selected", "Add (mid - i + 1) to count for each right selection"],
      "solution": {"approach": "Modified merge: count += (mid - i) when R[j] < L[i]", "complexity": {"time": "O(n log n)", "space": "O(n)"}}
    }
  ]
}'
Write-Host "topic_018 done"

# ===================== topic_019_quick_sort =====================
$t = "$base\module_03_searching_sorting\topics\topic_019_quick_sort"
W "$t\topic.json" '{
  "topicId": "topic_019_quick_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Quick Sort",
  "slug": "quick-sort",
  "order": 8,
  "estimatedMinutes": 30,
  "difficulty": "intermediate",
  "tags": ["quick sort","pivot","partition","in-place","divide conquer"],
  "prerequisites": ["topic_018_merge_sort"],
  "learningObjectives": ["Understand Lomuto partition","Implement quicksort","Analyze average and worst case","Use random pivot"],
  "status": "active"
}'
$s = @'
# Quick Sort

**Definition:** Select a pivot, partition elements (smaller left, larger right), recursively sort partitions.

**Real-time Example:** Seating arrangement - people shorter than pivot person seated on left, taller on right.

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best/Average | O(n log n) | O(log n) |
| Worst (sorted) | O(n^2) | O(n) |

## Key Properties
- In-place (no extra array)
- Not stable
- Faster than merge sort in practice (better cache performance)
'@
W "$t\summary.md" $s
$e = @'
# Quick Sort - In-Depth Explanation

## Lomuto Partition Scheme
Choose last element as pivot. Use index i to track boundary of smaller elements.

## Java Implementation

```java
class QuickSort {
    static int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (arr[j] < pivot) {
                i++;
                int temp = arr[i]; arr[i] = arr[j]; arr[j] = temp;
            }
        }
        // Place pivot at correct position
        int temp = arr[i+1]; arr[i+1] = arr[high]; arr[high] = temp;
        return i + 1;
    }
    static void quickSort(int[] arr, int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }
    public static void main(String[] args) {
        int[] arr = {10, 7, 8, 9, 1, 5};
        quickSort(arr, 0, arr.length - 1);
        for (int x : arr) System.out.print(x + " ");
        // Output: 1 5 7 8 9 10
    }
}
```

## Worst Case Avoidance
Use random pivot or median-of-three to prevent O(n^2) on sorted/reverse-sorted input.
'@
W "$t\explanation.md" $e
W "$t\examples.json" '{
  "topicId": "topic_019_quick_sort",
  "examples": [
    {
      "id": "ex_quick_sort",
      "title": "Quick Sort with Lomuto Partition",
      "language": "java",
      "description": "Partition around pivot, recurse on sub-arrays. In-place.",
      "code": "class QuickSort {\n    static int partition(int[] arr,int low,int high) {\n        int pivot=arr[high],i=low-1;\n        for(int j=low;j<high;j++) if(arr[j]<pivot){i++;int t=arr[i];arr[i]=arr[j];arr[j]=t;}\n        int t=arr[i+1];arr[i+1]=arr[high];arr[high]=t;\n        return i+1;\n    }\n    static void quickSort(int[] arr,int low,int high) {\n        if(low<high){int pi=partition(arr,low,high);quickSort(arr,low,pi-1);quickSort(arr,pi+1,high);}\n    }\n}",
      "output": "1 5 7 8 9 10",
      "complexity": {"time": "O(n log n) avg, O(n^2) worst", "space": "O(log n) avg"},
      "explanation": "Pivot placed at correct position each call. Recurse on left and right sub-arrays."
    }
  ]
}'
W "$t\questions.json" '{
  "topicId": "topic_019_quick_sort",
  "questions": [
    {
      "id": "q_026_quick_sort_worst",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Quick sort worst case",
      "options": ["O(n log n)", "O(n^2)", "O(log n)", "O(n)"],
      "correctAnswer": 1,
      "explanation": "Worst case when pivot always min/max (sorted array with last element pivot) - creates n recursion levels each O(n)."
    }
  ]
}'
W "$t\practice.json" '{
  "topicId": "topic_019_quick_sort",
  "problems": [
    {
      "id": "pp_quicksort_random",
      "title": "Randomized Quick Sort",
      "difficulty": "intermediate",
      "description": "Implement quicksort with random pivot to avoid worst case on sorted arrays.",
      "hints": ["Swap random element with last element before partitioning", "Expected O(n log n) on any input"],
      "solution": {"approach": "Random pivot: swap random with last, then standard partition", "complexity": {"time": "O(n log n) expected", "space": "O(log n)"}}
    }
  ]
}'
Write-Host "topic_019 done"

# ===================== topic_020_counting_sort =====================
$t = "$base\module_03_searching_sorting\topics\topic_020_counting_sort"
W "$t\topic.json" '{
  "topicId": "topic_020_counting_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Counting Sort",
  "slug": "counting-sort",
  "order": 9,
  "estimatedMinutes": 20,
  "difficulty": "intermediate",
  "tags": ["counting sort","non-comparison","frequency","O(n+k)"],
  "prerequisites": ["topic_019_quick_sort"],
  "learningObjectives": ["Understand non-comparison sorting","Apply counting sort","Analyze O(n+k)","Know limitations"],
  "status": "active"
}'
$s = @'
# Counting Sort

**Definition:** Sort by counting frequency of each distinct element, no comparisons needed.

**Real-time Example:** Counting votes in an election - count votes per candidate, then output in order.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(n+k) | O(k) |

k = range of input values

## Requirements
- Input must be non-negative integers
- Value range k must be reasonably small
'@
W "$t\summary.md" $s
$e = @'
# Counting Sort - In-Depth Explanation

## Algorithm Steps
1. Find max value k in array
2. Create count[0..k] array, initialize to 0
3. Count: count[arr[i]]++ for each element
4. Reconstruct: place count[i] copies of i in output

## Java Implementation

```java
class CountingSort {
    static void countingSort(int[] arr) {
        int max = 0;
        for (int x : arr) if (x > max) max = x;
        int[] count = new int[max + 1];
        for (int x : arr) count[x]++;
        int idx = 0;
        for (int i = 0; i <= max; i++)
            while (count[i]-- > 0) arr[idx++] = i;
    }
    public static void main(String[] args) {
        int[] arr = {4, 2, 2, 8, 3, 3, 1};
        countingSort(arr);
        for (int x : arr) System.out.print(x + " ");
        // Output: 1 2 2 3 3 4 8
    }
}
```

## Stable Version
For stable output, build cumulative prefix sum of count array, then place elements from right to left.
'@
W "$t\explanation.md" $e
W "$t\examples.json" '{
  "topicId": "topic_020_counting_sort",
  "examples": [
    {
      "id": "ex_counting_sort",
      "title": "Counting Sort for Integers",
      "language": "java",
      "description": "Count frequencies and reconstruct sorted array. No comparisons.",
      "code": "class CountingSort {\n    static void countingSort(int[] arr) {\n        int max=0; for(int x:arr) if(x>max) max=x;\n        int[] count=new int[max+1];\n        for(int x:arr) count[x]++;\n        int idx=0;\n        for(int i=0;i<=max;i++) while(count[i]-->0) arr[idx++]=i;\n    }\n}",
      "output": "1 2 2 3 3 4 8",
      "complexity": {"time": "O(n+k)", "space": "O(k)"},
      "explanation": "No comparisons. Works only for non-negative integers with small range k."
    }
  ]
}'
W "$t\questions.json" '{
  "topicId": "topic_020_counting_sort",
  "questions": [
    {
      "id": "q_027_counting_sort",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Counting sort works best when",
      "options": ["Values are large", "Values are small range", "Data is sorted", "Data is random"],
      "correctAnswer": 1,
      "explanation": "Counting sort is efficient when value range k is small - O(n+k) time and space is practical."
    }
  ]
}'
W "$t\practice.json" '{
  "topicId": "topic_020_counting_sort",
  "problems": [
    {
      "id": "pp_stable_counting_sort",
      "title": "Stable Counting Sort",
      "difficulty": "intermediate",
      "description": "Implement stable counting sort preserving original order of equal elements.",
      "hints": ["Build cumulative sum array from count array", "Fill output array from right to left for stability"],
      "solution": {"approach": "Cumulative count then backward fill", "complexity": {"time": "O(n+k)", "space": "O(n+k)"}}
    }
  ]
}'
Write-Host "topic_020 done"

# ===================== topic_021_radix_sort =====================
$t = "$base\module_03_searching_sorting\topics\topic_021_radix_sort"
W "$t\topic.json" '{
  "topicId": "topic_021_radix_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Radix Sort",
  "slug": "radix-sort",
  "order": 10,
  "estimatedMinutes": 25,
  "difficulty": "intermediate",
  "tags": ["radix sort","digit sort","LSD","non-comparison","O(d*(n+k))"],
  "prerequisites": ["topic_020_counting_sort"],
  "learningObjectives": ["Understand LSD radix sort","Use counting sort subroutine","Analyze O(d*(n+k))","Handle multi-digit integers"],
  "status": "active"
}'
$s = @'
# Radix Sort

**Definition:** Sort integers by processing one digit at a time, from least significant to most significant, using counting sort as subroutine.

**Real-time Example:** Sorting postal codes digit by digit from right to left.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(d*(n+k)) | O(n+k) |

d = number of digits, k = 10 (decimal base)

## When to Use
- Sorting integers with fixed number of digits
- When d is small constant (like 32-bit integers)
'@
W "$t\summary.md" $s
$e = @'
# Radix Sort - In-Depth Explanation

## LSD (Least Significant Digit) Process
Sort passes: units -> tens -> hundreds -> ...

Example: [170, 45, 75, 90, 802, 24, 2, 66]
- After units pass:  [170, 90, 802, 2, 24, 45, 75, 66]
- After tens pass:   [802, 2, 24, 45, 66, 170, 75, 90]
- After hundreds:    [2, 24, 45, 66, 75, 90, 170, 802]

## Java Implementation

```java
class RadixSort {
    static void countSort(int[] arr, int exp) {
        int n = arr.length;
        int[] output = new int[n];
        int[] count = new int[10];
        for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
        for (int i = 1; i < 10; i++) count[i] += count[i-1];
        for (int i = n-1; i >= 0; i--) output[--count[(arr[i]/exp)%10]] = arr[i];
        for (int i = 0; i < n; i++) arr[i] = output[i];
    }
    static void radixSort(int[] arr) {
        int max = 0;
        for (int x : arr) if (x > max) max = x;
        for (int exp = 1; max/exp > 0; exp *= 10) countSort(arr, exp);
    }
    public static void main(String[] args) {
        int[] arr = {170,45,75,90,802,24,2,66};
        radixSort(arr);
        for (int x : arr) System.out.print(x + " ");
        // Output: 2 24 45 66 75 90 170 802
    }
}
```
'@
W "$t\explanation.md" $e
W "$t\examples.json" '{
  "topicId": "topic_021_radix_sort",
  "examples": [
    {
      "id": "ex_radix_sort",
      "title": "LSD Radix Sort",
      "language": "java",
      "description": "Sort integers digit by digit using stable counting sort. O(d*(n+k)) time.",
      "code": "class RadixSort {\n    static void countSort(int[] arr, int exp) {\n        int n=arr.length;\n        int[] output=new int[n],count=new int[10];\n        for(int i=0;i<n;i++) count[(arr[i]/exp)%10]++;\n        for(int i=1;i<10;i++) count[i]+=count[i-1];\n        for(int i=n-1;i>=0;i--) output[--count[(arr[i]/exp)%10]]=arr[i];\n        for(int i=0;i<n;i++) arr[i]=output[i];\n    }\n    static void radixSort(int[] arr) {\n        int max=0; for(int x:arr) if(x>max) max=x;\n        for(int exp=1;max/exp>0;exp*=10) countSort(arr,exp);\n    }\n}",
      "output": "2 24 45 66 75 90 170 802",
      "complexity": {"time": "O(d*(n+k))", "space": "O(n+k)"},
      "explanation": "Each digit pass is stable counting sort. d passes for d-digit numbers. Linear for fixed integer size."
    }
  ]
}'
W "$t\questions.json" '{
  "topicId": "topic_021_radix_sort",
  "questions": [
    {
      "id": "q_028_sorting_stability",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Sorting stability means",
      "options": ["Sorted output", "Same order of equal elements preserved", "Less space", "Faster execution"],
      "correctAnswer": 1,
      "explanation": "A stable sort preserves relative order of records with equal keys. Radix sort depends on stable subroutine."
    }
  ]
}'
W "$t\practice.json" '{
  "topicId": "topic_021_radix_sort",
  "problems": [
    {
      "id": "pp_radix_strings",
      "title": "Sort Fixed-Length Strings with Radix Sort",
      "difficulty": "intermediate",
      "description": "Sort array of equal-length strings using LSD radix sort on each character position.",
      "hints": ["Process from last character to first character", "Use counting sort on ASCII values at each position"],
      "solution": {"approach": "LSD on each char index right to left, stable counting sort per pass", "complexity": {"time": "O(w*n) where w=string length", "space": "O(n)"}}
    }
  ]
}'
Write-Host "topic_021 done"
Write-Host ""
Write-Host "=== MODULE 03 ALL TOPICS COMPLETE ===" -ForegroundColor Green
