$base = "e:\sltechs\100_sourcecode\100_klassmet_UI\klassmet-content\content\courses\dsa_foundations\v1\modules"

# Helper to write file
function W($path, $content) {
    $dir = Split-Path $path
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    Set-Content -Path $path -Value $content -Encoding UTF8
}

# ===================== MODULE 03 remaining (016 examples+questions+practice already in prev step) =====================
# topic_016 - just examples/questions/practice were created in prev step, topic/summary/explanation were created manually
# Nothing more needed for 016

# ===================== topic_017_insertion_sort =====================
$t17 = "$base\module_03_searching_sorting\topics\topic_017_insertion_sort"
W "$t17\topic.json" '{
  "topicId": "topic_017_insertion_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Insertion Sort",
  "slug": "insertion-sort",
  "order": 6,
  "estimatedMinutes": 20,
  "difficulty": "beginner",
  "tags": ["insertion sort","sorting","comparison","cards"],
  "prerequisites": ["topic_016_selection_sort"],
  "learningObjectives": ["Understand insertion sort mechanism","Analyze best and worst case","Implement in Java","Identify when insertion sort is preferred"],
  "status": "active"
}'
W "$t17\summary.md" "# Insertion Sort

**Definition:** Builds sorted array one element at a time by inserting each element into its correct position.

**Real-time Example:** Arranging playing cards in hand — pick one card and insert it in sorted position.

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best (sorted) | O(n) | O(1) |
| Average | O(n²) | O(1) |
| Worst (reverse) | O(n²) | O(1) |

## When to Use
- Small arrays
- Nearly sorted data (best case O(n))"
W "$t17\explanation.md" "# Insertion Sort — In-Depth Explanation

## How It Works
Starting from index 1, take each element (key) and insert it into the correct position in the already-sorted left portion.

### Steps for [12, 11, 13, 5, 6]
- i=1: key=11, shift 12 right → [11, 12, 13, 5, 6]
- i=2: key=13, no shift → [11, 12, 13, 5, 6]
- i=3: key=5, shift 13,12,11 right → [5, 11, 12, 13, 6]
- i=4: key=6, shift 13,12,11 right → [5, 6, 11, 12, 13]

## Java Implementation
\`\`\`java
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
        for (int x : arr) System.out.print(x + ' '); // 5 6 11 12 13
    }
}
\`\`\`

## Key Points
- Stable sorting algorithm
- Adaptive — O(n) for nearly sorted input
- Online — can sort as new elements arrive
- In-place O(1) space"
W "$t17\examples.json" '{
  "topicId": "topic_017_insertion_sort",
  "examples": [
    {
      "id": "ex_insertion_sort",
      "title": "Insertion Sort",
      "language": "java",
      "description": "Sort array by inserting each element into sorted portion",
      "code": "class InsertionSort {\n    static void insertionSort(int[] arr) {\n        int n = arr.length;\n        for (int i = 1; i < n; i++) {\n            int key = arr[i]; int j = i - 1;\n            while (j >= 0 && arr[j] > key) { arr[j+1] = arr[j]; j--; }\n            arr[j+1] = key;\n        }\n    }\n}",
      "output": "5 6 11 12 13",
      "complexity": {"time": "O(n²)", "space": "O(1)"},
      "explanation": "Shifts elements right to make room for key. Best case O(n) for sorted input."
    }
  ]
}'
W "$t17\questions.json" '{
  "topicId": "topic_017_insertion_sort",
  "questions": [
    {
      "id": "q_017_best_case",
      "type": "mcq",
      "difficulty": "beginner",
      "question": "Insertion sort best case time complexity is",
      "options": ["O(n²)", "O(n log n)", "O(n)", "O(1)"],
      "correctAnswer": 2,
      "explanation": "When already sorted, each element needs only 1 comparison per pass (inner while runs 0 times), giving O(n)."
    }
  ]
}'
W "$t17\practice.json" '{
  "topicId": "topic_017_insertion_sort",
  "problems": [
    {
      "id": "pp_insertion_sort",
      "title": "Insertion Sort with Binary Search",
      "difficulty": "intermediate",
      "description": "Optimize insertion sort by using binary search to find the insertion position. Count total shifts.",
      "hints": ["Binary search reduces comparisons to O(log n) per element", "Total shifts still O(n²) in worst case"],
      "solution": {"approach": "Binary search for position, then shift elements", "complexity": {"time": "O(n²)", "space": "O(1)"}}
    }
  ]
}'
Write-Host "topic_017 complete"

# ===================== topic_018_merge_sort =====================
$t18 = "$base\module_03_searching_sorting\topics\topic_018_merge_sort"
W "$t18\topic.json" '{
  "topicId": "topic_018_merge_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Merge Sort",
  "slug": "merge-sort",
  "order": 7,
  "estimatedMinutes": 30,
  "difficulty": "intermediate",
  "tags": ["merge sort","divide conquer","stable sort","O(n log n)"],
  "prerequisites": ["topic_017_insertion_sort"],
  "learningObjectives": ["Understand divide and conquer","Implement merge sort","Analyze O(n log n) complexity","Apply for counting inversions"],
  "status": "active"
}'
W "$t18\summary.md" "# Merge Sort

**Definition:** Divide array into halves, recursively sort each half, merge the sorted halves.

**Real-time Example:** Merging sorted exam results from multiple classes into one ranked list.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(n log n) | O(n) |

## Advantages
- Guaranteed O(n log n) unlike quicksort
- Stable sorting algorithm
- Suitable for linked lists (no extra space needed)"
W "$t18\explanation.md" "# Merge Sort — In-Depth Explanation

## Divide and Conquer Strategy
1. **Divide**: Split array into two halves
2. **Conquer**: Recursively sort each half
3. **Combine**: Merge the two sorted halves

## Recursion Tree for [38, 27, 43, 3]
\`\`\`
[38,27,43,3]
  [38,27]  [43,3]
  [38][27] [43][3]
  [27,38]  [3,43]
  [3,27,38,43]
\`\`\`

## Java Implementation
\`\`\`java
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
        for (int x : arr) System.out.print(x + ' ');
        // Output: 3 9 10 27 38 43 82
    }
}
\`\`\`

## Complexity Analysis
- Time: O(n log n) — log n levels, O(n) work per level
- Space: O(n) — auxiliary arrays for merging"
W "$t18\examples.json" '{
  "topicId": "topic_018_merge_sort",
  "examples": [
    {
      "id": "ex_merge_sort",
      "title": "Merge Sort Full Implementation",
      "language": "java",
      "description": "Divide and conquer sort with merge step",
      "code": "class MergeSort {\n    static void merge(int[] arr, int l, int m, int r) {\n        int n1=m-l+1,n2=r-m;\n        int[] L=new int[n1],R=new int[n2];\n        for(int i=0;i<n1;i++) L[i]=arr[l+i];\n        for(int j=0;j<n2;j++) R[j]=arr[m+1+j];\n        int i=0,j=0,k=l;\n        while(i<n1&&j<n2) arr[k++]=(L[i]<=R[j])?L[i++]:R[j++];\n        while(i<n1) arr[k++]=L[i++];\n        while(j<n2) arr[k++]=R[j++];\n    }\n    static void mergeSort(int[] arr,int l,int r) {\n        if(l<r){int m=(l+r)/2;mergeSort(arr,l,m);mergeSort(arr,m+1,r);merge(arr,l,m,r);}\n    }\n}",
      "output": "3 9 10 27 38 43 82",
      "complexity": {"time": "O(n log n)", "space": "O(n)"},
      "explanation": "Splits recursively then merges. Stable sort, guaranteed O(n log n)."
    }
  ]
}'
W "$t18\questions.json" '{
  "topicId": "topic_018_merge_sort",
  "questions": [
    {
      "id": "q_024_merge_sort_technique",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Merge sort uses",
      "options": ["Greedy", "Backtracking", "Divide and conquer", "DP"],
      "correctAnswer": 2,
      "explanation": "Merge sort recursively divides the array into halves and merges sorted halves."
    },
    {
      "id": "q_025_merge_sort_space",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Merge sort space complexity",
      "options": ["O(1)", "O(log n)", "O(n)", "O(n²)"],
      "correctAnswer": 2,
      "explanation": "Merge sort requires O(n) auxiliary space for the temporary arrays used during merging."
    }
  ]
}'
W "$t18\practice.json" '{
  "topicId": "topic_018_merge_sort",
  "problems": [
    {
      "id": "pp_merge_sort_inversions",
      "title": "Count Inversions Using Merge Sort",
      "difficulty": "intermediate",
      "description": "Count number of inversions in array (i < j but arr[i] > arr[j]) using modified merge sort.",
      "hints": ["Count inversions during merge when R[j] < L[i]", "All remaining left elements form inversions with R[j]"],
      "solution": {"approach": "Modified merge: count + (mid - i) when right element selected", "complexity": {"time": "O(n log n)", "space": "O(n)"}}
    }
  ]
}'
Write-Host "topic_018 complete"

# ===================== topic_019_quick_sort =====================
$t19 = "$base\module_03_searching_sorting\topics\topic_019_quick_sort"
W "$t19\topic.json" '{
  "topicId": "topic_019_quick_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Quick Sort",
  "slug": "quick-sort",
  "order": 8,
  "estimatedMinutes": 30,
  "difficulty": "intermediate",
  "tags": ["quick sort","pivot","partition","divide conquer","in-place"],
  "prerequisites": ["topic_018_merge_sort"],
  "learningObjectives": ["Understand partitioning around pivot","Implement quicksort","Analyze average vs worst case","Compare with merge sort"],
  "status": "active"
}'
W "$t19\summary.md" "# Quick Sort

**Definition:** Partition array around a pivot, recursively sort the two halves.

**Real-time Example:** Seating people — shorter than pivot on left, taller on right.

## Complexity
| Case | Time | Space |
|------|------|-------|
| Best / Average | O(n log n) | O(log n) |
| Worst (sorted) | O(n²) | O(n) |

## Key Features
- In-place (no extra array)
- Not stable
- Average faster than merge sort in practice"
W "$t19\explanation.md" "# Quick Sort — In-Depth Explanation

## Partition Strategy (Lomuto)
Choose last element as pivot. Place smaller elements left, larger right. Pivot lands at correct final position.

## Java Implementation
\`\`\`java
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
        for (int x : arr) System.out.print(x + ' ');
        // Output: 1 5 7 8 9 10
    }
}
\`\`\`

## Worst Case Avoidance
Pick random pivot or median-of-three to avoid O(n²) on sorted input."
W "$t19\examples.json" '{
  "topicId": "topic_019_quick_sort",
  "examples": [
    {
      "id": "ex_quick_sort",
      "title": "Quick Sort with Lomuto Partition",
      "language": "java",
      "description": "Partition and recurse. Pivot placed at final position each call.",
      "code": "class QuickSort {\n    static int partition(int[] arr,int low,int high) {\n        int pivot=arr[high],i=low-1;\n        for(int j=low;j<high;j++) if(arr[j]<pivot){i++;int t=arr[i];arr[i]=arr[j];arr[j]=t;}\n        int t=arr[i+1];arr[i+1]=arr[high];arr[high]=t;\n        return i+1;\n    }\n    static void quickSort(int[] arr,int low,int high) {\n        if(low<high){int pi=partition(arr,low,high);quickSort(arr,low,pi-1);quickSort(arr,pi+1,high);}\n    }\n}",
      "output": "1 5 7 8 9 10",
      "complexity": {"time": "O(n log n) avg, O(n²) worst", "space": "O(log n) avg"},
      "explanation": "Each partition places pivot correctly. Recurse on left and right subarrays."
    }
  ]
}'
W "$t19\questions.json" '{
  "topicId": "topic_019_quick_sort",
  "questions": [
    {
      "id": "q_026_quick_sort_worst",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Quick sort worst case",
      "options": ["O(n log n)", "O(n²)", "O(log n)", "O(n)"],
      "correctAnswer": 1,
      "explanation": "Worst case when pivot is always min/max (sorted array), creating n-1 recursive calls each partitioning n-1 elements."
    }
  ]
}'
W "$t19\practice.json" '{
  "topicId": "topic_019_quick_sort",
  "problems": [
    {
      "id": "pp_quick_sort_random",
      "title": "Randomized Quick Sort",
      "difficulty": "intermediate",
      "description": "Implement quicksort with random pivot selection to avoid worst case on sorted input.",
      "hints": ["Swap random element with last before partitioning", "Expected O(n log n) on any input"],
      "solution": {"approach": "Random pivot swap before partition", "complexity": {"time": "O(n log n) expected", "space": "O(log n)"}}
    }
  ]
}'
Write-Host "topic_019 complete"

# ===================== topic_020_counting_sort =====================
$t20 = "$base\module_03_searching_sorting\topics\topic_020_counting_sort"
W "$t20\topic.json" '{
  "topicId": "topic_020_counting_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Counting Sort",
  "slug": "counting-sort",
  "order": 9,
  "estimatedMinutes": 20,
  "difficulty": "intermediate",
  "tags": ["counting sort","non-comparison","integer sort","frequency","O(n+k)"],
  "prerequisites": ["topic_019_quick_sort"],
  "learningObjectives": ["Understand non-comparison sorting","Apply counting sort for integer ranges","Analyze O(n+k) complexity","Know limitations"],
  "status": "active"
}'
W "$t20\summary.md" "# Counting Sort

**Definition:** Count occurrences of each value, then reconstruct sorted array from counts.

**Real-time Example:** Counting votes in an election where candidates are numbered 1-10.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(n+k) | O(k) |

k = range of input values

## When to Use
- Integer values in small known range
- When k is O(n)"
W "$t20\explanation.md" "# Counting Sort — In-Depth Explanation

## Algorithm Steps
1. Find max value k
2. Create count array of size k+1
3. Count occurrences of each element
4. Reconstruct sorted array from counts

## Java Implementation
\`\`\`java
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
        for (int x : arr) System.out.print(x + ' ');
        // Output: 1 2 2 3 3 4 8
    }
}
\`\`\`

## Stable Version
For stable counting sort, build cumulative count array and place elements from right to left."
W "$t20\examples.json" '{
  "topicId": "topic_020_counting_sort",
  "examples": [
    {
      "id": "ex_counting_sort",
      "title": "Counting Sort for Non-negative Integers",
      "language": "java",
      "description": "Count frequencies, reconstruct sorted array. O(n+k) time and space.",
      "code": "class CountingSort {\n    static void countingSort(int[] arr) {\n        int max=0; for(int x:arr) if(x>max) max=x;\n        int[] count=new int[max+1];\n        for(int x:arr) count[x]++;\n        int idx=0;\n        for(int i=0;i<=max;i++) while(count[i]-->0) arr[idx++]=i;\n    }\n}",
      "output": "1 2 2 3 3 4 8",
      "complexity": {"time": "O(n+k)", "space": "O(k)"},
      "explanation": "No comparisons needed. Works only for non-negative integers with known bounded range."
    }
  ]
}'
W "$t20\questions.json" '{
  "topicId": "topic_020_counting_sort",
  "questions": [
    {
      "id": "q_027_counting_sort",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Counting sort works best when",
      "options": ["Values are large", "Values are small range", "Data is sorted", "Data is random"],
      "correctAnswer": 1,
      "explanation": "Counting sort is efficient when the range k is small, making the O(n+k) time and space practical."
    }
  ]
}'
W "$t20\practice.json" '{
  "topicId": "topic_020_counting_sort",
  "problems": [
    {
      "id": "pp_counting_sort_stable",
      "title": "Stable Counting Sort",
      "difficulty": "intermediate",
      "description": "Implement stable counting sort that preserves original order of equal elements.",
      "hints": ["Build cumulative sum of count array", "Fill output array from right to left"],
      "solution": {"approach": "Cumulative count, fill output backward", "complexity": {"time": "O(n+k)", "space": "O(n+k)"}}
    }
  ]
}'
Write-Host "topic_020 complete"

# ===================== topic_021_radix_sort =====================
$t21 = "$base\module_03_searching_sorting\topics\topic_021_radix_sort"
W "$t21\topic.json" '{
  "topicId": "topic_021_radix_sort",
  "moduleId": "module_03_searching_sorting",
  "title": "Radix Sort",
  "slug": "radix-sort",
  "order": 10,
  "estimatedMinutes": 25,
  "difficulty": "intermediate",
  "tags": ["radix sort","digit sort","LSD","MSD","non-comparison"],
  "prerequisites": ["topic_020_counting_sort"],
  "learningObjectives": ["Understand LSD radix sort","Use counting sort as subroutine","Analyze O(d*(n+k)) complexity","Handle multi-digit integers"],
  "status": "active"
}'
W "$t21\summary.md" "# Radix Sort

**Definition:** Sort integers by processing individual digits from least significant to most significant using counting sort.

**Real-time Example:** Sorting postal codes digit by digit.

## Complexity
| Case | Time | Space |
|------|------|-------|
| All cases | O(d*(n+k)) | O(n+k) |

d = number of digits, k = 10 (decimal)

## Stability
Radix sort depends on stable counting sort at each digit position."
W "$t21\explanation.md" "# Radix Sort — In-Depth Explanation

## Process (LSD = Least Significant Digit first)
Sort by units digit → tens digit → hundreds digit, etc.

## Example: [170, 45, 75, 90, 802, 24, 2, 66]
- After units: [170, 90, 802, 2, 24, 45, 75, 66]
- After tens:  [802, 2, 24, 45, 66, 170, 75, 90]
- After hundreds: [2, 24, 45, 66, 75, 90, 170, 802]

## Java Implementation
\`\`\`java
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
        for (int x : arr) System.out.print(x + ' ');
        // Output: 2 24 45 66 75 90 170 802
    }
}
\`\`\`"
W "$t21\examples.json" '{
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
      "explanation": "Each digit pass uses stable counting sort. d passes for d-digit numbers."
    }
  ]
}'
W "$t21\questions.json" '{
  "topicId": "topic_021_radix_sort",
  "questions": [
    {
      "id": "q_028_sorting_stability",
      "type": "mcq",
      "difficulty": "intermediate",
      "question": "Sorting stability means",
      "options": ["Sorted output", "Same order of equal elements preserved", "Less space", "Faster execution"],
      "correctAnswer": 1,
      "explanation": "A stable sorting algorithm preserves the original relative order of equal elements."
    }
  ]
}'
W "$t21\practice.json" '{
  "topicId": "topic_021_radix_sort",
  "problems": [
    {
      "id": "pp_radix_sort_strings",
      "title": "Sort Fixed-Length Strings with Radix Sort",
      "difficulty": "intermediate",
      "description": "Sort an array of fixed-length strings using LSD radix sort on character positions.",
      "hints": ["Process from last character to first", "Use counting sort on ASCII values at each position"],
      "solution": {"approach": "LSD on each character index from right to left", "complexity": {"time": "O(w*n) where w=string length", "space": "O(n)"}}
    }
  ]
}'
Write-Host "topic_021 complete"
Write-Host "=== MODULE 03 ALL TOPICS DONE ===" -ForegroundColor Green
