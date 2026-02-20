# Script to generate all remaining DSA course content files
$base = "e:\sltechs\100_sourcecode\100_klassmet_UI\klassmet-content\content\courses\dsa_foundations\v1\modules"

function Create-TopicFiles {
    param(
        [string]$moduleDir,
        [string]$topicId,
        [string]$topicNum,
        [string]$title,
        [string]$slug,
        [int]$order,
        [string]$difficulty,
        [string[]]$tags,
        [string]$definition,
        [string]$realTimeExample,
        [string]$prerequisites,
        [string]$javaClass,
        [string]$javaCode,
        [string]$javaExplanation,
        [string[]]$questions,   # array of question JSON strings
        [string]$practiceTitle,
        [string]$practiceDesc,
        [string]$practiceHint
    )
    $topicDir = "$base\$moduleDir\topics\$topicId"
    New-Item -ItemType Directory -Force -Path $topicDir | Out-Null

    # topic.json
    $topicJson = @"
{
  "topicId": "$topicId",
  "moduleId": "module_$(($moduleDir -split '_')[1..2] -join '_')",
  "title": "$title",
  "slug": "$slug",
  "order": $order,
  "estimatedMinutes": 20,
  "difficulty": "$difficulty",
  "tags": [$(($tags | ForEach-Object { '"' + $_ + '"' }) -join ', ')],
  "prerequisites": ["$prerequisites"],
  "learningObjectives": [
    "Define $title and its core properties",
    "Apply $title to solve problems",
    "Analyze time and space complexity",
    "Implement $title in Java"
  ],
  "status": "active"
}
"@
    Set-Content "$topicDir\topic.json" $topicJson -Encoding UTF8

    # summary.md
    $summaryMd = @"
# $title

**Definition:** $definition

**Real-time Example:** $realTimeExample

## Key Concepts
- Core concept of $title
- Used in algorithm design and optimization
- Important for technical interviews

## Complexity at a Glance
| Operation | Time | Space |
|-----------|------|-------|
| Best | Varies | Varies |
| Average | Varies | Varies |
| Worst | Varies | Varies |
"@
    Set-Content "$topicDir\summary.md" $summaryMd -Encoding UTF8

    # explanation.md
    $explanationMd = @"
# $title — In-Depth Explanation

## Definition
$definition

## Real-time Example
$realTimeExample

## How It Works
$title is a fundamental concept in Data Structures and Algorithms. Understanding it builds the foundation for more complex algorithmic thinking.

## Java Implementation

``````java
$javaCode
``````

## Explanation
$javaExplanation

## Key Takeaways
- $title solves specific types of problems efficiently
- Know the time and space complexity
- Practice multiple variations to master it
"@
    Set-Content "$topicDir\explanation.md" $explanationMd -Encoding UTF8

    # examples.json
    $examplesJson = @"
{
  "topicId": "$topicId",
  "examples": [
    {
      "id": "ex_$(($topicId -replace 'topic_\d+_', ''))",
      "title": "$title Example",
      "language": "java",
      "description": "Java implementation of $title",
      "code": $(($javaCode | ConvertTo-Json)),
      "output": "See code comments for expected output",
      "complexity": {
        "time": "Varies",
        "space": "Varies"
      },
      "explanation": "$javaExplanation"
    }
  ]
}
"@
    Set-Content "$topicDir\examples.json" $examplesJson -Encoding UTF8

    # questions.json
    if ($questions.Count -gt 0) {
        $questionsContent = $questions -join ",`n    "
        $questionsJson = @"
{
  "topicId": "$topicId",
  "questions": [
    $questionsContent
  ]
}
"@
    } else {
        $questionsJson = @"
{
  "topicId": "$topicId",
  "questions": [
    {
      "id": "q_$(($topicId -replace 'topic_', '').Substring(0,3))_default",
      "type": "mcq",
      "difficulty": "$difficulty",
      "question": "Which best describes $title?",
      "options": ["Option A", "Option B", "Option C", "Option D"],
      "correctAnswer": 0,
      "explanation": "$definition"
    }
  ]
}
"@
    }
    Set-Content "$topicDir\questions.json" $questionsJson -Encoding UTF8

    # practice.json
    $practiceJson = @"
{
  "topicId": "$topicId",
  "problems": [
    {
      "id": "pp_$(($topicId -replace 'topic_\d+_', ''))",
      "title": "$practiceTitle",
      "difficulty": "$difficulty",
      "description": "$practiceDesc",
      "hints": ["$practiceHint"],
      "solution": {
        "approach": "Apply $title technique",
        "complexity": { "time": "Varies", "space": "Varies" }
      }
    }
  ]
}
"@
    Set-Content "$topicDir\practice.json" $practiceJson -Encoding UTF8

    Write-Host "Created: $topicId"
}

# ============================================================
# MODULE 03 — Topics 016-021 (remaining)
# ============================================================

# topic_016_selection_sort — files already partially created, create remaining
$topicDir16 = "$base\module_03_searching_sorting\topics\topic_016_selection_sort"
New-Item -ItemType Directory -Force -Path $topicDir16 | Out-Null

$ex16 = @"
{
  "topicId": "topic_016_selection_sort",
  "examples": [
    {
      "id": "ex_selection_sort",
      "title": "Selection Sort",
      "language": "java",
      "description": "Sort array by selecting minimum each pass",
      "code": "class SelectionSort {\n    static void selectionSort(int[] arr) {\n        int n = arr.length;\n        for (int i = 0; i < n - 1; i++) {\n            int minIdx = i;\n            for (int j = i + 1; j < n; j++) {\n                if (arr[j] < arr[minIdx]) minIdx = j;\n            }\n            int temp = arr[minIdx]; arr[minIdx] = arr[i]; arr[i] = temp;\n        }\n    }\n    public static void main(String[] args) {\n        int[] arr = {64, 25, 12, 22, 11};\n        selectionSort(arr);\n        for (int x : arr) System.out.print(x + \" \");\n    }\n}",
      "output": "11 12 22 25 64",
      "complexity": { "time": "O(n²)", "space": "O(1)" },
      "explanation": "Finds minimum element and swaps to front. Always O(n²)."
    }
  ]
}
"@
Set-Content "$topicDir16\examples.json" $ex16 -Encoding UTF8

$q16 = @"
{
  "topicId": "topic_016_selection_sort",
  "questions": [
    {
      "id": "q_016_default",
      "type": "mcq",
      "difficulty": "beginner",
      "question": "Selection sort always has time complexity of",
      "options": ["O(n)", "O(n log n)", "O(n²)", "O(1)"],
      "correctAnswer": 2,
      "explanation": "Selection sort always makes n*(n-1)/2 comparisons regardless of input, giving O(n²)."
    }
  ]
}
"@
Set-Content "$topicDir16\questions.json" $q16 -Encoding UTF8

$p16 = @"
{
  "topicId": "topic_016_selection_sort",
  "problems": [
    {
      "id": "pp_selection_sort",
      "title": "Implement Selection Sort",
      "difficulty": "beginner",
      "description": "Sort an array of integers using selection sort. Count total swaps performed.",
      "hints": ["Track minimum index in each pass", "Swap only when minIdx != i"],
      "solution": { "approach": "Find min in unsorted portion, swap with first unsorted", "complexity": { "time": "O(n²)", "space": "O(1)" } }
    }
  ]
}
"@
Set-Content "$topicDir16\practice.json" $p16 -Encoding UTF8
Write-Host "Completed topic_016_selection_sort remaining files"

# ============================================================
# topic_017_insertion_sort
# ============================================================
Create-TopicFiles `
    -moduleDir "module_03_searching_sorting" `
    -topicId "topic_017_insertion_sort" `
    -topicNum "017" `
    -title "Insertion Sort" `
    -slug "insertion-sort" `
    -order 6 `
    -difficulty "beginner" `
    -tags @("insertion sort","sorting","comparison","arrays") `
    -definition "Insert each element into its correct position in the sorted portion." `
    -realTimeExample "Arranging playing cards in hand one by one." `
    -prerequisites "topic_016_selection_sort" `
    -javaClass "InsertionSort" `
    -javaCode "class InsertionSort {
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
        for (int x : arr) System.out.print(x + ' ');
    }
}" `
    -javaExplanation "Builds sorted array left to right. Best case O(n) when already sorted." `
    -questions @(
        '{"id":"q_017_default","type":"mcq","difficulty":"beginner","question":"Insertion sort best case time complexity is","options":["O(n²)","O(n log n)","O(n)","O(1)"],"correctAnswer":2,"explanation":"When array is already sorted, insertion sort needs only one comparison per element."}'
    ) `
    -practiceTitle "Insertion Sort Variants" `
    -practiceDesc "Implement insertion sort. Verify it is stable by sorting objects with equal keys." `
    -practiceHint "Equal elements should maintain original relative order"

# ============================================================
# topic_018_merge_sort
# ============================================================
Create-TopicFiles `
    -moduleDir "module_03_searching_sorting" `
    -topicId "topic_018_merge_sort" `
    -topicNum "018" `
    -title "Merge Sort" `
    -slug "merge-sort" `
    -order 7 `
    -difficulty "intermediate" `
    -tags @("merge sort","divide conquer","sorting","O(n log n)") `
    -definition "Divide and merge sorted parts using divide-and-conquer." `
    -realTimeExample "Merging sorted exam results from multiple classes." `
    -prerequisites "topic_017_insertion_sort" `
    -javaClass "MergeSort" `
    -javaCode "class MergeSort {
    static void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1, n2 = r - m;
        int[] L = new int[n1], R = new int[n2];
        for (int i = 0; i < n1; i++) L[i] = arr[l + i];
        for (int j = 0; j < n2; j++) R[j] = arr[m + 1 + j];
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) arr[k++] = L[i++];
            else arr[k++] = R[j++];
        }
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
    }
}" `
    -javaExplanation "Divides array recursively, sorts halves, merges. Time O(n log n), Space O(n)." `
    -questions @(
        '{"id":"q_024_merge_sort_technique","type":"mcq","difficulty":"intermediate","question":"Merge sort uses","options":["Greedy","Backtracking","Divide and conquer","DP"],"correctAnswer":2,"explanation":"Merge sort recursively divides the array and merges sorted halves."}',
        '{"id":"q_025_merge_sort_space","type":"mcq","difficulty":"intermediate","question":"Merge sort space complexity","options":["O(1)","O(log n)","O(n)","O(n²)"],"correctAnswer":2,"explanation":"Merge sort requires O(n) auxiliary space for temporary arrays during merging."}'
    ) `
    -practiceTitle "Count Inversions Using Merge Sort" `
    -practiceDesc "Count the number of inversions in an array using modified merge sort." `
    -practiceHint "Count inversions during the merge step when right element is smaller than left"

# ============================================================
# topic_019_quick_sort
# ============================================================
Create-TopicFiles `
    -moduleDir "module_03_searching_sorting" `
    -topicId "topic_019_quick_sort" `
    -topicNum "019" `
    -title "Quick Sort" `
    -slug "quick-sort" `
    -order 8 `
    -difficulty "intermediate" `
    -tags @("quick sort","divide conquer","pivot","sorting") `
    -definition "Partition array around a pivot element, recursively sort partitions." `
    -realTimeExample "Seating people shorter than a person on one side, taller on another." `
    -prerequisites "topic_018_merge_sort" `
    -javaClass "QuickSort" `
    -javaCode "class QuickSort {
    static int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (arr[j] < pivot) {
                i++;
                int temp = arr[i]; arr[i] = arr[j]; arr[j] = temp;
            }
        }
        int temp = arr[i + 1]; arr[i + 1] = arr[high]; arr[high] = temp;
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
    }
}" `
    -javaExplanation "Pivot placed at correct position, elements smaller left, larger right. Average O(n log n), worst O(n²) when already sorted." `
    -questions @(
        '{"id":"q_026_quick_sort_worst","type":"mcq","difficulty":"intermediate","question":"Quick sort worst case","options":["O(n log n)","O(n²)","O(log n)","O(n)"],"correctAnswer":1,"explanation":"Worst case occurs when pivot is always smallest or largest element (sorted array with last element as pivot)."}'
    ) `
    -practiceTitle "3-Way Quick Sort" `
    -practiceDesc "Implement 3-way partitioning quick sort to handle duplicate elements efficiently." `
    -practiceHint "Divide array into three parts: less than, equal to, and greater than pivot"

# ============================================================
# topic_020_counting_sort
# ============================================================
Create-TopicFiles `
    -moduleDir "module_03_searching_sorting" `
    -topicId "topic_020_counting_sort" `
    -topicNum "020" `
    -title "Counting Sort" `
    -slug "counting-sort" `
    -order 9 `
    -difficulty "intermediate" `
    -tags @("counting sort","non-comparison","integer sort","frequency") `
    -definition "Sort using frequency counts of each distinct element (works on small integer range)." `
    -realTimeExample "Counting votes and arranging candidates by vote count." `
    -prerequisites "topic_019_quick_sort" `
    -javaClass "CountingSort" `
    -javaCode "class CountingSort {
    static void countingSort(int[] arr) {
        int max = 0;
        for (int x : arr) if (x > max) max = x;
        int[] count = new int[max + 1];
        for (int x : arr) count[x]++;
        int idx = 0;
        for (int i = 0; i <= max; i++) {
            while (count[i]-- > 0) arr[idx++] = i;
        }
    }
    public static void main(String[] args) {
        int[] arr = {4, 2, 2, 8, 3, 3, 1};
        countingSort(arr);
        for (int x : arr) System.out.print(x + ' ');
        // Output: 1 2 2 3 3 4 8
    }
}" `
    -javaExplanation "Counts frequency of each value, then reconstructs sorted array. O(n+k) time and space where k is value range." `
    -questions @(
        '{"id":"q_027_counting_sort_best","type":"mcq","difficulty":"intermediate","question":"Counting sort works best when","options":["Values are large","Values are small range","Data is sorted","Data is random"],"correctAnswer":1,"explanation":"Counting sort is efficient when the range of values (k) is small relative to n."}'
    ) `
    -practiceTitle "Sort Characters by Frequency" `
    -practiceDesc "Given a string, sort characters by decreasing frequency using counting sort approach." `
    -practiceHint "Count frequency of each character then reconstruct sorted string"

# ============================================================
# topic_021_radix_sort
# ============================================================
Create-TopicFiles `
    -moduleDir "module_03_searching_sorting" `
    -topicId "topic_021_radix_sort" `
    -topicNum "021" `
    -title "Radix Sort" `
    -slug "radix-sort" `
    -order 10 `
    -difficulty "intermediate" `
    -tags @("radix sort","non-comparison","digit sort","LSD","MSD") `
    -definition "Sort numbers digit by digit from least significant to most significant using counting sort as subroutine." `
    -realTimeExample "Sorting postal codes by sorting one digit at a time." `
    -prerequisites "topic_020_counting_sort" `
    -javaClass "RadixSort" `
    -javaCode "class RadixSort {
    static void countSort(int[] arr, int exp) {
        int n = arr.length;
        int[] output = new int[n];
        int[] count = new int[10];
        for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
        for (int i = 1; i < 10; i++) count[i] += count[i - 1];
        for (int i = n - 1; i >= 0; i--) {
            output[--count[(arr[i] / exp) % 10]] = arr[i];
        }
        for (int i = 0; i < n; i++) arr[i] = output[i];
    }
    static void radixSort(int[] arr) {
        int max = 0;
        for (int x : arr) if (x > max) max = x;
        for (int exp = 1; max / exp > 0; exp *= 10) countSort(arr, exp);
    }
    public static void main(String[] args) {
        int[] arr = {170, 45, 75, 90, 802, 24, 2, 66};
        radixSort(arr);
        for (int x : arr) System.out.print(x + ' ');
        // Output: 2 24 45 66 75 90 170 802
    }
}" `
    -javaExplanation "Sorts by each digit position using stable counting sort. O(d*(n+k)) where d=digits, k=10 for decimal." `
    -questions @(
        '{"id":"q_028_sorting_stability","type":"mcq","difficulty":"intermediate","question":"Sorting stability means","options":["Sorted output","Same order of equal elements preserved","Less space","Faster execution"],"correctAnswer":1,"explanation":"A stable sort preserves the relative order of records with equal keys."}'
    ) `
    -practiceTitle "Radix Sort with Negative Numbers" `
    -practiceDesc "Extend radix sort to handle negative integers in the input array." `
    -practiceHint "Separate negatives and positives, sort each group, combine"

# ============================================================
# MODULE 04 — Recursion & Backtracking (topics 022-024)
# ============================================================
$mod4 = "module_04_recursion_backtracking"
New-Item -ItemType Directory -Force -Path "$base\$mod4\topics" | Out-Null

$mod4Json = @"
{
  "moduleId": "module_04_recursion_backtracking",
  "courseId": "course_dsa_foundations",
  "title": "Recursion & Backtracking",
  "slug": "recursion-backtracking",
  "order": 4,
  "estimatedHours": 3,
  "description": "Master recursive thinking, recursion trees, and backtracking to solve complex problems.",
  "topics": ["topic_022_recursion","topic_023_recursion_tree","topic_024_backtracking"],
  "prerequisites": ["module_03_searching_sorting"],
  "status": "active"
}
"@
Set-Content "$base\$mod4\module.json" $mod4Json -Encoding UTF8

Create-TopicFiles `
    -moduleDir $mod4 -topicId "topic_022_recursion" -topicNum "022" `
    -title "Recursion" -slug "recursion" -order 1 -difficulty "intermediate" `
    -tags @("recursion","base case","call stack","self-referential") `
    -definition "A function that calls itself to solve a smaller version of the same problem." `
    -realTimeExample "Russian nesting dolls — each doll contains a smaller version of itself." `
    -prerequisites "topic_021_radix_sort" `
    -javaClass "RecursionExample" `
    -javaCode "class RecursionExample {
    // Factorial
    static int factorial(int n) {
        if (n == 0) return 1;        // base case
        return n * factorial(n - 1); // recursive case
    }
    // Fibonacci
    static int fib(int n) {
        if (n <= 1) return n;
        return fib(n - 1) + fib(n - 2);
    }
    public static void main(String[] args) {
        System.out.println(factorial(5)); // 120
        System.out.println(fib(6));       // 8
    }
}" `
    -javaExplanation "Factorial base case n=0 returns 1. Each call reduces n by 1. Call stack depth = n." `
    -questions @(
        '{"id":"q_029_recursion_base","type":"mcq","difficulty":"intermediate","question":"Recursion must have","options":["Loop","Base condition","Global variable","Pointer"],"correctAnswer":1,"explanation":"Without a base condition, recursion would call itself infinitely causing a stack overflow."}',
        '{"id":"q_030_recursion_stack","type":"mcq","difficulty":"intermediate","question":"Recursion uses","options":["Heap","Queue","Stack","Array"],"correctAnswer":2,"explanation":"Each recursive call is pushed onto the call stack. When the base case is reached, calls are popped (LIFO)."}'
    ) `
    -practiceTitle "Power Function Using Recursion" `
    -practiceDesc "Implement power(base, exp) recursively. Optimize using fast exponentiation." `
    -practiceHint "power(x, n) = power(x, n/2) * power(x, n/2) for even n"

Create-TopicFiles `
    -moduleDir $mod4 -topicId "topic_023_recursion_tree" -topicNum "023" `
    -title "Recursion Tree" -slug "recursion-tree" -order 2 -difficulty "intermediate" `
    -tags @("recursion tree","complexity analysis","visual","recursive calls") `
    -definition "A visualization of all recursive calls made by a function showing the tree of subproblems." `
    -realTimeExample "Family tree showing how each generation expands." `
    -prerequisites "topic_022_recursion" `
    -javaClass "RecursionTreeExample" `
    -javaCode "class RecursionTreeExample {
    // Fibonacci with depth tracking to visualize recursion tree
    static int fib(int n, int depth) {
        String indent = '  '.repeat(depth);
        System.out.println(indent + 'fib(' + n + ')');
        if (n <= 1) return n;
        int left = fib(n - 1, depth + 1);
        int right = fib(n - 2, depth + 1);
        return left + right;
    }
    public static void main(String[] args) {
        System.out.println('Result: ' + fib(4, 0));
    }
}" `
    -javaExplanation "Each fib(n) spawns fib(n-1) and fib(n-2). Total nodes = 2^n. Helps identify overlapping subproblems." `
    -questions @() `
    -practiceTitle "Analyze Recursion Tree for Merge Sort" `
    -practiceDesc "Draw the recursion tree for mergeSort([8,3,5,1]) and count total merge operations." `
    -practiceHint "Each level of the tree doubles the number of calls"

Create-TopicFiles `
    -moduleDir $mod4 -topicId "topic_024_backtracking" -topicNum "024" `
    -title "Backtracking" -slug "backtracking" -order 3 -difficulty "intermediate" `
    -tags @("backtracking","brute force","pruning","combinatorics","N-Queens") `
    -definition "Try all possible paths, undo (backtrack) invalid choices, and explore alternatives." `
    -realTimeExample "Solving a maze — try each path, backtrack when you hit a dead end." `
    -prerequisites "topic_023_recursion_tree" `
    -javaClass "BacktrackingExample" `
    -javaCode "class BacktrackingExample {
    // Generate all binary strings of length n
    static void binaryStrings(char[] arr, int idx) {
        if (idx == arr.length) {
            System.out.println(new String(arr));
            return;
        }
        arr[idx] = '0';
        binaryStrings(arr, idx + 1);
        arr[idx] = '1';
        binaryStrings(arr, idx + 1);
    }
    // N-Queens checker
    static boolean isSafe(int[] board, int row, int col) {
        for (int i = 0; i < row; i++) {
            if (board[i] == col || Math.abs(board[i] - col) == Math.abs(i - row))
                return false;
        }
        return true;
    }
    static void nQueens(int[] board, int row, int n) {
        if (row == n) { System.out.println(java.util.Arrays.toString(board)); return; }
        for (int col = 0; col < n; col++) {
            if (isSafe(board, row, col)) {
                board[row] = col;
                nQueens(board, row + 1, n);
            }
        }
    }
    public static void main(String[] args) {
        binaryStrings(new char[3], 0);
        nQueens(new int[4], 0, 4);
    }
}" `
    -javaExplanation "Backtracking explores all options recursively. N-Queens places queens row by row, backtracking on conflict." `
    -questions @() `
    -practiceTitle "Sudoku Solver" `
    -practiceDesc "Implement a Sudoku solver using backtracking. Fill empty cells following Sudoku rules." `
    -practiceHint "For each empty cell try 1-9, check validity, recurse; backtrack if no valid number"

Write-Host "`n=== MODULE 04 COMPLETE ===" -ForegroundColor Green

# ============================================================
# MODULE 05 — Linked Structures (topics 025-027)
# ============================================================
$mod5 = "module_05_linked_structures"
New-Item -ItemType Directory -Force -Path "$base\$mod5\topics" | Out-Null

$mod5Json = @"
{
  "moduleId": "module_05_linked_structures",
  "courseId": "course_dsa_foundations",
  "title": "Linked Structures",
  "slug": "linked-structures",
  "order": 5,
  "estimatedHours": 3,
  "description": "Understand singly, doubly, and circular linked lists and their operations.",
  "topics": ["topic_025_singly_linked_list","topic_026_doubly_linked_list","topic_027_circular_linked_list"],
  "prerequisites": ["module_04_recursion_backtracking"],
  "status": "active"
}
"@
Set-Content "$base\$mod5\module.json" $mod5Json -Encoding UTF8

Create-TopicFiles `
    -moduleDir $mod5 -topicId "topic_025_singly_linked_list" -topicNum "025" `
    -title "Singly Linked List" -slug "singly-linked-list" -order 1 -difficulty "beginner" `
    -tags @("singly linked list","nodes","pointer","dynamic") `
    -definition "A linear data structure where each node contains data and a pointer to the next node." `
    -realTimeExample "Treasure hunt clues — each clue points to the location of the next." `
    -prerequisites "topic_024_backtracking" `
    -javaClass "SinglyLinkedList" `
    -javaCode "class SinglyLinkedList {
    static class Node {
        int data;
        Node next;
        Node(int data) { this.data = data; }
    }
    Node head;
    void insert(int data) {
        Node newNode = new Node(data);
        if (head == null) { head = newNode; return; }
        Node curr = head;
        while (curr.next != null) curr = curr.next;
        curr.next = newNode;
    }
    void reverse() {
        Node prev = null, curr = head, next;
        while (curr != null) {
            next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }
        head = prev;
    }
    boolean detectCycle() {
        Node slow = head, fast = head;
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            if (slow == fast) return true;
        }
        return false;
    }
    void print() {
        Node curr = head;
        while (curr != null) { System.out.print(curr.data + ' '); curr = curr.next; }
        System.out.println();
    }
    public static void main(String[] args) {
        SinglyLinkedList list = new SinglyLinkedList();
        list.insert(1); list.insert(2); list.insert(3);
        list.print();    // 1 2 3
        list.reverse();
        list.print();    // 3 2 1
    }
}" `
    -javaExplanation "Linked list traversal is O(n). Reverse uses three pointers. Floyd's cycle detection uses slow/fast pointers." `
    -questions @(
        '{"id":"q_031_ll_memory","type":"mcq","difficulty":"beginner","question":"Linked list stores data in","options":["Contiguous memory","Random memory","Linked memory","Cache"],"correctAnswer":2,"explanation":"Linked list nodes can be anywhere in memory, connected by pointers."}',
        '{"id":"q_032_ll_advantage","type":"mcq","difficulty":"beginner","question":"Advantage of linked list","options":["Fast indexing","Dynamic size","Less memory","Cache-friendly"],"correctAnswer":1,"explanation":"Linked lists grow/shrink dynamically, unlike arrays which have fixed size."}',
        '{"id":"q_033_ll_disadvantage","type":"mcq","difficulty":"beginner","question":"Disadvantage of linked list","options":["Dynamic memory","Extra memory for pointer","Easy insertion","Easy deletion"],"correctAnswer":1,"explanation":"Each node requires extra memory for the pointer field, increasing memory overhead."}',
        '{"id":"q_034_cycle_detection","type":"mcq","difficulty":"intermediate","question":"Detect cycle uses","options":["Binary search","Floyd algorithm","DP","Greedy"],"correctAnswer":1,"explanation":"Floyd cycle detection (tortoise and hare) uses slow/fast pointers to detect cycles in O(n) time."}',
        '{"id":"q_035_reverse_ll","type":"mcq","difficulty":"beginner","question":"Reverse linked list complexity","options":["O(1)","O(log n)","O(n)","O(n²)"],"correctAnswer":2,"explanation":"Reversing requires visiting every node once, giving O(n) time complexity."}'
    ) `
    -practiceTitle "Merge Two Sorted Linked Lists" `
    -practiceDesc "Merge two sorted singly linked lists into one sorted list without creating new nodes." `
    -practiceHint "Use a dummy head node and compare heads of both lists"

Create-TopicFiles `
    -moduleDir $mod5 -topicId "topic_026_doubly_linked_list" -topicNum "026" `
    -title "Doubly Linked List" -slug "doubly-linked-list" -order 2 -difficulty "beginner" `
    -tags @("doubly linked list","bidirectional","prev pointer","browser navigation") `
    -definition "A linked list where each node has pointers to both next and previous nodes." `
    -realTimeExample "Browser back and forward navigation history." `
    -prerequisites "topic_025_singly_linked_list" `
    -javaClass "DoublyLinkedList" `
    -javaCode "class DoublyLinkedList {
    static class Node {
        int data;
        Node prev, next;
        Node(int data) { this.data = data; }
    }
    Node head, tail;
    void addFront(int data) {
        Node newNode = new Node(data);
        if (head == null) { head = tail = newNode; return; }
        newNode.next = head;
        head.prev = newNode;
        head = newNode;
    }
    void addEnd(int data) {
        Node newNode = new Node(data);
        if (tail == null) { head = tail = newNode; return; }
        tail.next = newNode;
        newNode.prev = tail;
        tail = newNode;
    }
    void printForward() {
        Node curr = head;
        while (curr != null) { System.out.print(curr.data + ' '); curr = curr.next; }
        System.out.println();
    }
    void printBackward() {
        Node curr = tail;
        while (curr != null) { System.out.print(curr.data + ' '); curr = curr.prev; }
        System.out.println();
    }
    public static void main(String[] args) {
        DoublyLinkedList dll = new DoublyLinkedList();
        dll.addEnd(1); dll.addEnd(2); dll.addEnd(3);
        dll.printForward();  // 1 2 3
        dll.printBackward(); // 3 2 1
    }
}" `
    -javaExplanation "Doubly linked list supports O(1) insertion/deletion at both ends with tail pointer. Bidirectional traversal." `
    -questions @() `
    -practiceTitle "LRU Cache using Doubly Linked List" `
    -practiceDesc "Implement an LRU (Least Recently Used) cache using a doubly linked list and HashMap." `
    -practiceHint "HashMap for O(1) lookup, DLL for O(1) move-to-front and eviction"

Create-TopicFiles `
    -moduleDir $mod5 -topicId "topic_027_circular_linked_list" -topicNum "027" `
    -title "Circular Linked List" -slug "circular-linked-list" -order 3 -difficulty "intermediate" `
    -tags @("circular linked list","cycle","round robin","scheduling") `
    -definition "A linked list where the last node points back to the head, forming a circle." `
    -realTimeExample "Round-robin scheduling where tasks cycle back to the beginning." `
    -prerequisites "topic_026_doubly_linked_list" `
    -javaClass "CircularLinkedList" `
    -javaCode "class CircularLinkedList {
    static class Node {
        int data;
        Node next;
        Node(int data) { this.data = data; }
    }
    Node head;
    void insert(int data) {
        Node newNode = new Node(data);
        if (head == null) { head = newNode; newNode.next = head; return; }
        Node curr = head;
        while (curr.next != head) curr = curr.next;
        curr.next = newNode;
        newNode.next = head;
    }
    void print() {
        if (head == null) return;
        Node curr = head;
        do {
            System.out.print(curr.data + ' ');
            curr = curr.next;
        } while (curr != head);
        System.out.println();
    }
    public static void main(String[] args) {
        CircularLinkedList cll = new CircularLinkedList();
        cll.insert(1); cll.insert(2); cll.insert(3);
        cll.print(); // 1 2 3
    }
}" `
    -javaExplanation "Last node's next points to head. Traversal uses do-while to process all nodes back to head." `
    -questions @(
        '{"id":"q_036_circular_ll","type":"mcq","difficulty":"beginner","question":"Circular linked list last node points to","options":["NULL","Head","Tail","Middle"],"correctAnswer":1,"explanation":"In a circular linked list, the last node next pointer points back to the head node."}'
    ) `
    -practiceTitle "Josephus Problem" `
    -practiceDesc "Solve the Josephus problem using a circular linked list. n people in circle, every k-th eliminated." `
    -practiceHint "Use circular list, advance k-1 steps, delete next node, repeat until one remains"

Write-Host "`n=== MODULE 05 COMPLETE ===" -ForegroundColor Green

# ============================================================
# MODULE 06 — Stack & Queue (topics 028-035)
# ============================================================
$mod6 = "module_06_stack_queue"
New-Item -ItemType Directory -Force -Path "$base\$mod6\topics" | Out-Null

$mod6Json = @"
{
  "moduleId": "module_06_stack_queue",
  "courseId": "course_dsa_foundations",
  "title": "Stack & Queue",
  "slug": "stack-queue",
  "order": 6,
  "estimatedHours": 4,
  "description": "Master stack and queue data structures with applications like monotonic stack, circular queue, deque, and priority queue.",
  "topics": ["topic_028_stack","topic_029_stack_applications","topic_030_monotonic_stack","topic_031_queue","topic_032_circular_queue","topic_033_deque","topic_034_monotonic_queue","topic_035_priority_queue"],
  "prerequisites": ["module_05_linked_structures"],
  "status": "active"
}
"@
Set-Content "$base\$mod6\module.json" $mod6Json -Encoding UTF8

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_028_stack" -topicNum "028" `
    -title "Stack" -slug "stack" -order 1 -difficulty "beginner" `
    -tags @("stack","LIFO","push","pop","call stack") `
    -definition "A Last-In First-Out (LIFO) linear data structure. Elements are pushed/popped from the top." `
    -realTimeExample "Stack of plates — last plate placed is first to be taken." `
    -prerequisites "topic_027_circular_linked_list" `
    -javaClass "StackArray" `
    -javaCode "import java.util.Stack;
class StackExample {
    public static void main(String[] args) {
        Stack<Integer> stack = new Stack<>();
        stack.push(10);
        stack.push(20);
        stack.push(30);
        System.out.println(stack.peek()); // 30
        System.out.println(stack.pop());  // 30
        System.out.println(stack.size()); // 2
        System.out.println(stack.isEmpty()); // false
        // Valid parentheses check
        String s = '({[]})';
        Stack<Character> parenStack = new Stack<>();
        boolean valid = true;
        for (char c : s.toCharArray()) {
            if (c == '(' || c == '{' || c == '[') parenStack.push(c);
            else {
                if (parenStack.isEmpty()) { valid = false; break; }
                char top = parenStack.pop();
                if ((c==')' && top!='(') || (c=='}' && top!='{') || (c==']' && top!='['))
                    { valid = false; break; }
            }
        }
        System.out.println(valid); // true
    }
}" `
    -javaExplanation "Stack follows LIFO. Java Stack class supports push, pop, peek. Valid parentheses uses stack to match brackets." `
    -questions @(
        '{"id":"q_037_stack_lifo","type":"mcq","difficulty":"beginner","question":"Stack follows","options":["FIFO","LIFO","FILO","Random"],"correctAnswer":1,"explanation":"Stack is Last-In First-Out — the most recently pushed element is the first to be popped."}',
        '{"id":"q_039_stack_use","type":"mcq","difficulty":"beginner","question":"Stack is used in","options":["Scheduling","Function calls","Networking","Storage"],"correctAnswer":1,"explanation":"Function calls use the call stack — each call is pushed, return pops it (LIFO)."}',
        '{"id":"q_040_valid_paren","type":"mcq","difficulty":"intermediate","question":"Valid parentheses problem uses","options":["Queue","Stack","Tree","Graph"],"correctAnswer":1,"explanation":"Stack matches opening brackets — when closing bracket found, pop and verify match."}'
    ) `
    -practiceTitle "Next Greater Element" `
    -practiceDesc "Find the next greater element for each element in the array using a stack." `
    -practiceHint "Iterate right to left, use stack to track candidates for next greater"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_029_stack_applications" -topicNum "029" `
    -title "Stack Applications" -slug "stack-applications" -order 2 -difficulty "intermediate" `
    -tags @("stack applications","undo redo","expression evaluation","function calls") `
    -definition "Practical uses of stack including function call management, expression evaluation, and undo/redo operations." `
    -realTimeExample "Undo/Redo in text editors — each action pushed to undo stack." `
    -prerequisites "topic_028_stack" `
    -javaClass "StackApplications" `
    -javaCode "import java.util.Stack;
class StackApplications {
    // Reverse a string using stack
    static String reverseString(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) stack.push(c);
        StringBuilder sb = new StringBuilder();
        while (!stack.isEmpty()) sb.append(stack.pop());
        return sb.toString();
    }
    // Evaluate postfix expression
    static int evalPostfix(String expr) {
        Stack<Integer> stack = new Stack<>();
        for (char c : expr.toCharArray()) {
            if (Character.isDigit(c)) stack.push(c - '0');
            else {
                int b = stack.pop(), a = stack.pop();
                if (c == '+') stack.push(a + b);
                else if (c == '-') stack.push(a - b);
                else if (c == '*') stack.push(a * b);
                else stack.push(a / b);
            }
        }
        return stack.pop();
    }
    public static void main(String[] args) {
        System.out.println(reverseString('hello')); // olleh
        System.out.println(evalPostfix('231*+9-')); // -4
    }
}" `
    -javaExplanation "String reversal: push all chars, pop to reverse. Postfix evaluation: push operands, apply operator to top two." `
    -questions @() `
    -practiceTitle "Implement Undo/Redo" `
    -practiceDesc "Build a simple text editor with undo/redo using two stacks." `
    -practiceHint "Use undoStack for applied operations, redoStack for undone operations"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_030_monotonic_stack" -topicNum "030" `
    -title "Monotonic Stack" -slug "monotonic-stack" -order 3 -difficulty "intermediate" `
    -tags @("monotonic stack","next greater","stock span","increasing","decreasing") `
    -definition "A stack that maintains elements in monotonically increasing or decreasing order by popping violating elements." `
    -realTimeExample "Stock price span problem — days where price is lower than current day price." `
    -prerequisites "topic_029_stack_applications" `
    -javaClass "MonotonicStack" `
    -javaCode "import java.util.*;
class MonotonicStack {
    // Next Greater Element
    static int[] nextGreater(int[] arr) {
        int n = arr.length;
        int[] result = new int[n];
        Arrays.fill(result, -1);
        Deque<Integer> stack = new ArrayDeque<>();
        for (int i = 0; i < n; i++) {
            while (!stack.isEmpty() && arr[stack.peek()] < arr[i]) {
                result[stack.pop()] = arr[i];
            }
            stack.push(i);
        }
        return result;
    }
    // Daily Temperatures
    static int[] dailyTemperatures(int[] temps) {
        int n = temps.length;
        int[] answer = new int[n];
        Deque<Integer> stack = new ArrayDeque<>();
        for (int i = 0; i < n; i++) {
            while (!stack.isEmpty() && temps[stack.peek()] < temps[i]) {
                int idx = stack.pop();
                answer[idx] = i - idx;
            }
            stack.push(i);
        }
        return answer;
    }
    public static void main(String[] args) {
        System.out.println(Arrays.toString(nextGreater(new int[]{4,5,2,25})));
        // [5, 25, 25, -1]
    }
}" `
    -javaExplanation "Pop elements from stack when current element is greater (for next-greater problems). Remaining stack elements have no greater element." `
    -questions @(
        '{"id":"q_041_monotonic_stack","type":"mcq","difficulty":"intermediate","question":"Monotonic stack maintains","options":["Random order","Sorted order","Increasing/decreasing order","FIFO"],"correctAnswer":2,"explanation":"Monotonic stack keeps elements in increasing or decreasing order by popping elements that violate the order."}'
    ) `
    -practiceTitle "Largest Rectangle in Histogram" `
    -practiceDesc "Find the area of the largest rectangle that can be formed in a histogram." `
    -practiceHint "Use monotonic stack to find left and right boundaries for each bar"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_031_queue" -topicNum "031" `
    -title "Queue" -slug "queue" -order 4 -difficulty "beginner" `
    -tags @("queue","FIFO","enqueue","dequeue","BFS") `
    -definition "A First-In First-Out (FIFO) linear data structure. Elements are enqueued at rear and dequeued from front." `
    -realTimeExample "People waiting in a queue — first person in is first to be served." `
    -prerequisites "topic_030_monotonic_stack" `
    -javaClass "QueueExample" `
    -javaCode "import java.util.*;
class QueueExample {
    public static void main(String[] args) {
        Queue<Integer> queue = new LinkedList<>();
        queue.offer(10); // enqueue
        queue.offer(20);
        queue.offer(30);
        System.out.println(queue.peek()); // 10 (front)
        System.out.println(queue.poll()); // 10 (dequeue)
        System.out.println(queue.size()); // 2
        // BFS using queue
        int[][] graph = {{1,2},{3},{3},{4},{}};
        boolean[] visited = new boolean[5];
        Queue<Integer> bfsQ = new LinkedList<>();
        bfsQ.offer(0); visited[0] = true;
        while (!bfsQ.isEmpty()) {
            int node = bfsQ.poll();
            System.out.print(node + ' ');
            for (int neighbor : graph[node]) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    bfsQ.offer(neighbor);
                }
            }
        }
    }
}" `
    -javaExplanation "Queue offers O(1) enqueue/dequeue. BFS uses queue for level-order graph exploration." `
    -questions @(
        '{"id":"q_038_queue_fifo","type":"mcq","difficulty":"beginner","question":"Queue follows","options":["LIFO","FIFO","Random","Stack order"],"correctAnswer":1,"explanation":"Queue is First-In First-Out — the first element enqueued is the first to be dequeued."}'
    ) `
    -practiceTitle "Implement Queue using Stacks" `
    -practiceDesc "Implement a queue using two stacks. Support enqueue and dequeue in amortized O(1)." `
    -practiceHint "Use one stack for push, another for pop. Transfer when pop stack is empty"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_032_circular_queue" -topicNum "032" `
    -title "Circular Queue" -slug "circular-queue" -order 5 -difficulty "intermediate" `
    -tags @("circular queue","ring buffer","memory efficient","CPU scheduling") `
    -definition "A queue that connects the end back to the front, reusing empty space at the front after dequeue." `
    -realTimeExample "CPU task scheduling — tasks cycle through repeatedly." `
    -prerequisites "topic_031_queue" `
    -javaClass "CircularQueue" `
    -javaCode "class CircularQueue {
    int[] arr;
    int front, rear, size, capacity;
    CircularQueue(int capacity) {
        this.capacity = capacity;
        arr = new int[capacity];
        front = rear = size = 0;
    }
    boolean enqueue(int val) {
        if (size == capacity) return false; // full
        arr[rear] = val;
        rear = (rear + 1) % capacity;
        size++;
        return true;
    }
    int dequeue() {
        if (size == 0) return -1; // empty
        int val = arr[front];
        front = (front + 1) % capacity;
        size--;
        return val;
    }
    int peek() { return size == 0 ? -1 : arr[front]; }
    public static void main(String[] args) {
        CircularQueue cq = new CircularQueue(3);
        cq.enqueue(1); cq.enqueue(2); cq.enqueue(3);
        System.out.println(cq.dequeue()); // 1
        cq.enqueue(4); // reuses slot
        System.out.println(cq.dequeue()); // 2
    }
}" `
    -javaExplanation "Modular arithmetic (rear+1)%capacity wraps around. Prevents memory waste by reusing freed slots." `
    -questions @(
        '{"id":"q_042_circular_queue","type":"mcq","difficulty":"intermediate","question":"Circular queue helps to","options":["Reduce time","Use memory efficiently","Sort data","Search data"],"correctAnswer":1,"explanation":"Circular queue reuses freed memory at the front, avoiding wastage in linear queue implementation."}'
    ) `
    -practiceTitle "Sliding Window Maximum" `
    -practiceDesc "Find maximum in every window of size k in an array using circular queue/deque." `
    -practiceHint "Maintain a deque of indices where elements are in decreasing order"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_033_deque" -topicNum "033" `
    -title "Deque" -slug "deque" -order 6 -difficulty "intermediate" `
    -tags @("deque","double ended queue","sliding window","palindrome") `
    -definition "A double-ended queue that supports insertion and deletion from both front and rear in O(1)." `
    -realTimeExample "Sliding window problems where you need to add/remove from both ends." `
    -prerequisites "topic_032_circular_queue" `
    -javaClass "DequeExample" `
    -javaCode "import java.util.*;
class DequeExample {
    public static void main(String[] args) {
        Deque<Integer> deque = new ArrayDeque<>();
        deque.addFirst(1);
        deque.addLast(2);
        deque.addFirst(0);
        System.out.println(deque); // [0, 1, 2]
        System.out.println(deque.removeFirst()); // 0
        System.out.println(deque.removeLast());  // 2
        // Palindrome check
        String s = 'racecar';
        Deque<Character> dq = new ArrayDeque<>();
        for (char c : s.toCharArray()) dq.addLast(c);
        boolean isPalin = true;
        while (dq.size() > 1) {
            if (dq.removeFirst() != dq.removeLast()) { isPalin = false; break; }
        }
        System.out.println(isPalin); // true
    }
}" `
    -javaExplanation "ArrayDeque provides O(1) front and rear operations. Can act as both stack and queue. Palindrome check removes from both ends." `
    -questions @() `
    -practiceTitle "Implement Deque using Doubly Linked List" `
    -practiceDesc "Implement a deque from scratch using a doubly linked list. Support O(1) all operations." `
    -practiceHint "Head node for front operations, tail node for rear operations"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_034_monotonic_queue" -topicNum "034" `
    -title "Monotonic Queue" -slug "monotonic-queue" -order 7 -difficulty "advanced" `
    -tags @("monotonic queue","sliding window maximum","min max tracking","deque") `
    -definition "A deque maintaining monotonic order (increasing/decreasing) for efficient range min/max queries." `
    -realTimeExample "Tracking maximum temperature over a sliding time window." `
    -prerequisites "topic_033_deque" `
    -javaClass "MonotonicQueue" `
    -javaCode "import java.util.*;
class MonotonicQueue {
    // Sliding Window Maximum using Monotonic Queue
    static int[] maxSlidingWindow(int[] nums, int k) {
        int n = nums.length;
        int[] result = new int[n - k + 1];
        Deque<Integer> dq = new ArrayDeque<>(); // stores indices
        for (int i = 0; i < n; i++) {
            // Remove elements outside window
            while (!dq.isEmpty() && dq.peekFirst() < i - k + 1)
                dq.pollFirst();
            // Remove smaller elements from rear
            while (!dq.isEmpty() && nums[dq.peekLast()] < nums[i])
                dq.pollLast();
            dq.addLast(i);
            if (i >= k - 1) result[i - k + 1] = nums[dq.peekFirst()];
        }
        return result;
    }
    public static void main(String[] args) {
        System.out.println(Arrays.toString(maxSlidingWindow(new int[]{1,3,-1,-3,5,3,6,7}, 3)));
        // [3, 3, 5, 5, 6, 7]
    }
}" `
    -javaExplanation "Monotonic decreasing deque: front always has max index. Remove indices out of window from front, remove smaller values from rear." `
    -questions @() `
    -practiceTitle "Shortest Subarray with Sum at Least K" `
    -practiceDesc "Find the minimum length subarray with sum >= k using monotonic deque on prefix sums." `
    -practiceHint "Build prefix sum array, use monotonic deque on index differences"

Create-TopicFiles `
    -moduleDir $mod6 -topicId "topic_035_priority_queue" -topicNum "035" `
    -title "Priority Queue" -slug "priority-queue" -order 8 -difficulty "intermediate" `
    -tags @("priority queue","heap","min heap","max heap","Dijkstra") `
    -definition "A queue where each element has a priority; elements with highest priority are dequeued first." `
    -realTimeExample "Emergency room — critical patients treated before less critical ones." `
    -prerequisites "topic_034_monotonic_queue" `
    -javaClass "PriorityQueueExample" `
    -javaCode "import java.util.*;
class PriorityQueueExample {
    public static void main(String[] args) {
        // Min Priority Queue (default)
        PriorityQueue<Integer> minPQ = new PriorityQueue<>();
        minPQ.offer(5); minPQ.offer(1); minPQ.offer(3);
        System.out.println(minPQ.poll()); // 1 (minimum)
        // Max Priority Queue
        PriorityQueue<Integer> maxPQ = new PriorityQueue<>(Collections.reverseOrder());
        maxPQ.offer(5); maxPQ.offer(1); maxPQ.offer(3);
        System.out.println(maxPQ.poll()); // 5 (maximum)
        // K largest elements
        int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
        int k = 3;
        PriorityQueue<Integer> pq = new PriorityQueue<>(); // min heap of size k
        for (int x : arr) {
            pq.offer(x);
            if (pq.size() > k) pq.poll();
        }
        System.out.println('Top ' + k + ' largest: ' + pq);
    }
}" `
    -javaExplanation "Java PriorityQueue is a min-heap. Use Collections.reverseOrder() for max-heap. K largest: maintain min-heap of size k." `
    -questions @() `
    -practiceTitle "Merge K Sorted Lists" `
    -practiceDesc "Merge k sorted linked lists into one sorted list using a priority queue." `
    -practiceHint "Add heads of all lists to min-PQ, repeatedly extract min and add its next"

Write-Host "`n=== MODULE 06 COMPLETE ===" -ForegroundColor Green

# ============================================================
# MODULE 07 — Hashing (topics 036-040)
# ============================================================
$mod7 = "module_07_hashing"
New-Item -ItemType Directory -Force -Path "$base\$mod7\topics" | Out-Null

$mod7Json = @"
{
  "moduleId": "module_07_hashing",
  "courseId": "course_dsa_foundations",
  "title": "Hashing",
  "slug": "hashing",
  "order": 7,
  "estimatedHours": 3,
  "description": "Learn hashing concepts, hash tables, collision handling, HashMap, and HashSet for O(1) average operations.",
  "topics": ["topic_036_hashing_concepts","topic_037_hash_tables","topic_038_collision_handling","topic_039_hashmap","topic_040_hashset"],
  "prerequisites": ["module_06_stack_queue"],
  "status": "active"
}
"@
Set-Content "$base\$mod7\module.json" $mod7Json -Encoding UTF8

Create-TopicFiles `
    -moduleDir $mod7 -topicId "topic_036_hashing_concepts" -topicNum "036" `
    -title "Hashing Concepts" -slug "hashing-concepts" -order 1 -difficulty "intermediate" `
    -tags @("hashing","hash function","key","index mapping") `
    -definition "Mapping keys to indexed slots in a table using a hash function for O(1) average lookup." `
    -realTimeExample "Phone contacts lookup — name maps directly to phone number." `
    -prerequisites "topic_035_priority_queue" `
    -javaClass "HashingConcepts" `
    -javaCode "class HashingConcepts {
    // Simple hash function
    static int hashFunction(String key, int tableSize) {
        int hash = 0;
        for (char c : key.toCharArray()) {
            hash = (hash * 31 + c) % tableSize;
        }
        return hash;
    }
    public static void main(String[] args) {
        int tableSize = 10;
        String key = 'hello';
        System.out.println('Hash of ' + key + ' = ' + hashFunction(key, tableSize));
        // Polymorphic hash: same input always same output
        System.out.println(hashFunction('hello', 10) == hashFunction('hello', 10)); // true
    }
}" `
    -javaExplanation "Hash function converts key to index. Good hash: uniform distribution, deterministic, O(1)." `
    -questions @(
        '{"id":"q_043_hashing_complexity","type":"mcq","difficulty":"intermediate","question":"Hashing provides","options":["O(n) search","O(log n) search","O(1) average search","O(n²) search"],"correctAnswer":2,"explanation":"With a good hash function and low load factor, hash table operations are O(1) average."}'
    ) `
    -practiceTitle "Design Hash Function" `
    -practiceDesc "Design a hash function for strings that minimizes collisions. Test with a set of 100 words." `
    -practiceHint "Use polynomial rolling hash: hash = sum(char[i] * prime^i) mod tableSize"

Create-TopicFiles `
    -moduleDir $mod7 -topicId "topic_037_hash_tables" -topicNum "037" `
    -title "Hash Tables" -slug "hash-tables" -order 2 -difficulty "intermediate" `
    -tags @("hash table","array","direct address","load factor") `
    -definition "A data structure that stores key-value pairs using array slots indexed by hash function output." `
    -realTimeExample "Database indexing — quick row lookup by primary key." `
    -prerequisites "topic_036_hashing_concepts" `
    -javaClass "HashTableImpl" `
    -javaCode "class HashTableImpl {
    static class Entry {
        String key;
        int value;
        Entry next; // for chaining
        Entry(String k, int v) { key = k; value = v; }
    }
    Entry[] table;
    int capacity;
    HashTableImpl(int capacity) {
        this.capacity = capacity;
        table = new Entry[capacity];
    }
    int hash(String key) {
        int h = 0;
        for (char c : key.toCharArray()) h = (h * 31 + c) % capacity;
        return h;
    }
    void put(String key, int value) {
        int idx = hash(key);
        Entry curr = table[idx];
        while (curr != null) {
            if (curr.key.equals(key)) { curr.value = value; return; }
            curr = curr.next;
        }
        Entry newEntry = new Entry(key, value);
        newEntry.next = table[idx];
        table[idx] = newEntry;
    }
    int get(String key) {
        int idx = hash(key);
        Entry curr = table[idx];
        while (curr != null) {
            if (curr.key.equals(key)) return curr.value;
            curr = curr.next;
        }
        return -1;
    }
    public static void main(String[] args) {
        HashTableImpl ht = new HashTableImpl(16);
        ht.put('age', 25);
        ht.put('score', 100);
        System.out.println(ht.get('age'));   // 25
        System.out.println(ht.get('score')); // 100
    }
}" `
    -javaExplanation "Hash table with chaining: linked list at each slot handles collisions. O(1) average for put/get with low load factor." `
    -questions @() `
    -practiceTitle "Word Frequency Counter" `
    -practiceDesc "Count frequency of each word in a paragraph using a hash table." `
    -practiceHint "Split by spaces, use word as key and increment count as value"

Create-TopicFiles `
    -moduleDir $mod7 -topicId "topic_038_collision_handling" -topicNum "038" `
    -title "Collision Handling" -slug "collision-handling" -order 3 -difficulty "intermediate" `
    -tags @("collision","chaining","open addressing","linear probing") `
    -definition "Techniques to resolve conflicts when two keys hash to the same index: chaining and open addressing." `
    -realTimeExample "Multiple cars assigned same toll booth lane — handled by queuing or redirecting." `
    -prerequisites "topic_037_hash_tables" `
    -javaClass "CollisionHandling" `
    -javaCode "class CollisionHandling {
    // Open Addressing - Linear Probing
    static class OpenAddressHash {
        String[] keys;
        int[] values;
        int capacity;
        OpenAddressHash(int cap) {
            capacity = cap;
            keys = new String[cap];
            values = new int[cap];
        }
        int hash(String key) {
            int h = 0;
            for (char c : key.toCharArray()) h = (h * 31 + c) % capacity;
            return h;
        }
        void put(String key, int val) {
            int idx = hash(key);
            while (keys[idx] != null && !keys[idx].equals(key))
                idx = (idx + 1) % capacity; // linear probe
            keys[idx] = key;
            values[idx] = val;
        }
        int get(String key) {
            int idx = hash(key);
            while (keys[idx] != null) {
                if (keys[idx].equals(key)) return values[idx];
                idx = (idx + 1) % capacity;
            }
            return -1;
        }
    }
    public static void main(String[] args) {
        OpenAddressHash oah = new OpenAddressHash(7);
        oah.put('a', 1); oah.put('b', 2); oah.put('h', 8);
        System.out.println(oah.get('a')); // 1
        System.out.println(oah.get('h')); // 8
    }
}" `
    -javaExplanation "Linear probing finds next empty slot on collision. Chaining uses linked list at slot. Open addressing has better cache performance." `
    -questions @(
        '{"id":"q_044_collision","type":"mcq","difficulty":"intermediate","question":"Collision occurs when","options":["Hash table is empty","Two keys map to same index","Table is full","Key is null"],"correctAnswer":1,"explanation":"Collision happens when hash(key1) == hash(key2) for different keys."}'
    ) `
    -practiceTitle "Implement Chaining Hash Table" `
    -practiceDesc "Build a hash table using separate chaining. Compare performance with open addressing." `
    -practiceHint "Each slot holds a LinkedList of (key,value) pairs"

Create-TopicFiles `
    -moduleDir $mod7 -topicId "topic_039_hashmap" -topicNum "039" `
    -title "HashMap" -slug "hashmap" -order 4 -difficulty "beginner" `
    -tags @("hashmap","key-value","java","frequency count") `
    -definition "A key-value based data structure providing O(1) average insert, delete, and lookup operations." `
    -realTimeExample "Username maps to user profile data in a web application." `
    -prerequisites "topic_038_collision_handling" `
    -javaClass "HashMapExample" `
    -javaCode "import java.util.*;
class HashMapExample {
    public static void main(String[] args) {
        // Basic operations
        HashMap<String, Integer> map = new HashMap<>();
        map.put('apple', 3);
        map.put('banana', 5);
        map.put('cherry', 2);
        System.out.println(map.get('banana'));       // 5
        System.out.println(map.containsKey('apple')); // true
        map.put('apple', 10); // update
        // Frequency count
        String[] words = {'hi', 'hello', 'hi', 'world', 'hello', 'hi'};
        HashMap<String, Integer> freq = new HashMap<>();
        for (String w : words) freq.put(w, freq.getOrDefault(w, 0) + 1);
        System.out.println(freq); // {hi=3, hello=2, world=1}
        // Iterate
        for (Map.Entry<String, Integer> e : freq.entrySet()) {
            System.out.println(e.getKey() + ': ' + e.getValue());
        }
    }
}" `
    -javaExplanation "HashMap stores key-value pairs. getOrDefault handles missing keys gracefully. entrySet() for iteration. O(1) average for all operations." `
    -questions @(
        '{"id":"q_045_hashmap","type":"mcq","difficulty":"beginner","question":"HashMap stores","options":["Only keys","Only values","Key-value pairs","Index-value pairs"],"correctAnswer":2,"explanation":"HashMap stores (key,value) pairs where each unique key maps to exactly one value."}'
    ) `
    -practiceTitle "Two Sum Problem" `
    -practiceDesc "Find two numbers in array that add to target using a HashMap for O(n) solution." `
    -practiceHint "Store complement (target - num) in map, check if current num exists in map"

Create-TopicFiles `
    -moduleDir $mod7 -topicId "topic_040_hashset" -topicNum "040" `
    -title "HashSet" -slug "hashset" -order 5 -difficulty "beginner" `
    -tags @("hashset","unique","duplicate detection","contains","O(1)") `
    -definition "A hash-based collection that stores unique elements with O(1) average add, remove, contains." `
    -realTimeExample "Unique email registration — reject duplicate email addresses." `
    -prerequisites "topic_039_hashmap" `
    -javaClass "HashSetExample" `
    -javaCode "import java.util.*;
class HashSetExample {
    public static void main(String[] args) {
        HashSet<Integer> set = new HashSet<>();
        set.add(1); set.add(2); set.add(3); set.add(2);
        System.out.println(set.size());       // 3 (no duplicates)
        System.out.println(set.contains(2));  // true
        set.remove(2);
        System.out.println(set.contains(2));  // false
        // Find duplicates in array
        int[] arr = {1, 2, 3, 1, 2, 5};
        HashSet<Integer> seen = new HashSet<>();
        List<Integer> duplicates = new ArrayList<>();
        for (int x : arr) {
            if (!seen.add(x)) duplicates.add(x);
        }
        System.out.println('Duplicates: ' + duplicates); // [1, 2]
        // Intersection of two arrays
        int[] arr2 = {2, 3, 6};
        HashSet<Integer> set2 = new HashSet<>();
        for (int x : arr2) set2.add(x);
        List<Integer> intersection = new ArrayList<>();
        for (int x : seen) if (set2.contains(x)) intersection.add(x);
        System.out.println('Intersection: ' + intersection);
    }
}" `
    -javaExplanation "HashSet.add() returns false if element already present — use for duplicate detection. Intersection/union in O(n)." `
    -questions @(
        '{"id":"q_046_hashset","type":"mcq","difficulty":"beginner","question":"HashSet stores","options":["Duplicate values","Ordered values","Unique values","Key-value pairs"],"correctAnswer":2,"explanation":"HashSet stores only unique elements, automatically rejecting duplicates."}'
    ) `
    -practiceTitle "Longest Consecutive Sequence" `
    -practiceDesc "Find the length of longest consecutive elements sequence using HashSet for O(n) solution." `
    -practiceHint "Only start counting from elements where (num-1) is not in set"

Write-Host "`n=== MODULE 07 COMPLETE ===" -ForegroundColor Green

Write-Host "`n=== BATCH 1 COMPLETE (Mod03 remaining + Mod04-07) ===" -ForegroundColor Cyan
