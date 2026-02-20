# KlassMet DSA Course – Content Authoring Guide (Option A, 14 Modules)

This guide is the **golden standard** for converting the **"📘 COMPLETE DSA TOPICS (FULL COURSE)"** document into KlassMet content.

It explains **step by step** how a developer/content author should create:

- Course
- Modules (14)
- Topics (70)
- Questions (70 MCQs)
- Examples
- Practice placeholders (TBD)

All examples below assume course key: `dsa_foundations`.

---

## 1. Folder Structure

Create this structure:

```text
content/
  courses/
    dsa_foundations/
      v1/
        course.json
        manifest.json
        modules/
          module_01_programming_analysis/
          module_02_arrays_strings/
          module_03_searching_sorting/
          module_04_recursion_backtracking/
          module_05_linked_structures/
          module_06_stack_queue/
          module_07_hashing/
          module_08_trees/
          module_09_heap/
          module_10_graphs/
          module_11_greedy/
          module_12_dynamic_programming/
          module_13_bit_manipulation/
          module_14_advanced_ds/
        exams/
          exam_dsa_module_01.json
          exam_dsa_module_02.json
          ...
```

> **Rule:** One folder per course version (`v1`, `v2`, …). One folder per module. One folder per topic.

---

## 2. Create `course.json`

**Path:** `content/courses/dsa_foundations/v1/course.json`

```json
{
  "id": "course_dsa_foundations",
  "slug": "dsa-foundations",
  "title": "DSA Foundations – From Basics to Advanced",
  "description": "Complete DSA course covering programming basics, arrays, searching, sorting, recursion, graphs, dynamic programming, and advanced data structures.",
  "level": "beginner_to_intermediate",
  "estimatedHours": 40,
  "status": "active",
  "version": 1
}
```

> **Rule:** `id` starts with `course_`, `slug` is kebab-case.

---

## 3. Create `manifest.json`

**Path:** `content/courses/dsa_foundations/v1/manifest.json`

```json
{
  "id": "manifest_dsa_foundations_v1",
  "versionId": "content_version_dsa_v1",
  "courseId": "course_dsa_foundations",
  "entryModuleId": "module_01_programming_analysis",
  "defaultLocale": "en-IN",
  "features": {
    "dynamicQuizzesEnabled": true,
    "moduleExamsEnabled": true,
    "assignmentsEnabled": false
  },
  "quizDefaults": {
    "totalQuestions": 10,
    "difficultyMix": {
      "beginner": 60,
      "intermediate": 30,
      "advanced": 10
    },
    "topicCoverage": {
      "minimumCoveragePercent": 70,
      "maxQuestionsPerTopic": 3,
      "ensureAllTopics": false
    }
  }
}
```

> **Rule:** `entryModuleId` = first module.

---

## 4. Define the 14 Modules

Map document modules → module IDs:

| # | Document Module | Module ID |
|---|----------------|-----------|
| 1 | Programming & Analysis | `module_01_programming_analysis` |
| 2 | Arrays & Strings | `module_02_arrays_strings` |
| 3 | Searching & Sorting | `module_03_searching_sorting` |
| 4 | Recursion & Backtracking | `module_04_recursion_backtracking` |
| 5 | Linked Structures | `module_05_linked_structures` |
| 6 | Stack & Queue | `module_06_stack_queue` |
| 7 | Hashing | `module_07_hashing` |
| 8 | Trees | `module_08_trees` |
| 9 | Heap | `module_09_heap` |
| 10 | Graphs | `module_10_graphs` |
| 11 | Greedy Algorithms | `module_11_greedy` |
| 12 | Dynamic Programming | `module_12_dynamic_programming` |
| 13 | Bit Manipulation | `module_13_bit_manipulation` |
| 14 | Advanced DS | `module_14_advanced_ds` |

For each module:

1. Create folder: `content/courses/dsa_foundations/v1/modules/<module_id>/`
2. Inside, create:
   - `module.json`
   - `topics/` folder

**Example:** `module_01_programming_analysis/module.json`

```json
{
  "id": "module_01_programming_analysis",
  "courseId": "course_dsa_foundations",
  "title": "Programming & Analysis",
  "description": "Programming basics, algorithms, time and space complexity, and asymptotic notations.",
  "order": 1,
  "topics": [
    "topic_001_programming_basics",
    "topic_002_algorithms_problem_solving",
    "topic_003_time_complexity",
    "topic_004_space_complexity",
    "topic_005_asymptotic_notations"
  ]
}
```

> **Rule:** `order` = module number. `topics` = ordered list of topic IDs.

---

## 5. Define Topics per Module

### 5.1 Topic ID Pattern

```
topic_XXX_<short_snake_case_title>
```

- `XXX` = 3-digit running number across course (001–070)

**Examples:**

| Topic | ID |
|-------|----|
| Programming Basics | `topic_001_programming_basics` |
| Algorithms & Problem Solving | `topic_002_algorithms_problem_solving` |

### 5.2 Topic Folder Structure

For each topic:

```text
modules/<module_id>/topics/<topic_id>/
  topic.json
  summary.md
  explanation.md
  examples.json
  questions.json
  practice.json
```

---

## 6. Create `topic.json` (Per Topic)

### 6.1 Example: Programming Basics

**Path:** `modules/module_01_programming_analysis/topics/topic_001_programming_basics/topic.json`

```json
{
  "id": "topic_001_programming_basics",
  "moduleId": "module_01_programming_analysis",
  "title": "Programming Basics",
  "slug": "programming-basics",
  "order": 1,
  "difficulty": "beginner",
  "tags": ["programming", "basics"],
  "estimatedMinutes": 15,
  "learningOutcomes": [
    "Define programming in simple terms.",
    "Relate programming to real-world step-by-step instructions."
  ],
  "prerequisites": [],
  "status": "active",
  "version": 1
}
```

> **Rules:**
> - `slug` = kebab-case of title
> - `order` = position inside module
> - `difficulty` = `beginner` / `intermediate` / `advanced`

---

## 7. Fill `summary.md` and `explanation.md`

### 7.1 `summary.md`

Short, 2–4 lines, learner-friendly.

**Example (Programming Basics):**

```markdown
Programming is the act of writing instructions for a computer to solve problems or perform tasks.

In this topic, you'll connect the idea of programming to everyday step-by-step instructions,
like telling an ATM how to dispense cash.
```

### 7.2 `explanation.md`

Deeper explanation with headings and real-time example from the document.

**Example (Algorithms & Problem Solving):**

```markdown
### What is an Algorithm?

An algorithm is a finite set of steps to solve a problem.

It is not a programming language or hardware—it is the logic or procedure behind the solution.

#### Real-time Example

A recipe for cooking food:

1. Gather ingredients
2. Chop vegetables
3. Heat oil
4. Add spices
5. Cook for 10 minutes

This is an algorithm in real life: a clear, ordered sequence of steps.

In programming, algorithms are implemented using code, but the algorithm itself is language-agnostic.
```

> **Rule:** Use the definition and real-time example from the document wherever available.  
> If missing → write `TBD` and leave a comment in code review.

---

## 8. Fill `examples.json`

Use Java examples from the document where present.

### 8.1 Example (Algorithms – Sum of Two Numbers)

```json
[
  {
    "id": "ex_algorithm_sum_two_numbers",
    "title": "Algorithm – Sum of Two Numbers",
    "description": "Simple algorithm and Java implementation to add two numbers.",
    "language": "java",
    "code": "class AlgorithmExample {\n  public static void main(String[] args) {\n    int a = 10;\n    int b = 20;\n    int sum = a + b;\n    System.out.println(sum);\n  }\n}",
    "explanation": "The algorithm is: take inputs, add them, print the result.",
    "order": 1
  }
]
```

> **Rules:**
> - `id` starts with `ex_`
> - `code` is valid Java from the document
> - If no example in document → create file with `[]` or a single TBD example

---

## 9. Fill `questions.json` (Map MCQs)

### 9.1 Mapping Rules

Use the 70 MCQs at the top of the document. For each MCQ:

1. Decide the topic it belongs to.
2. Create one entry in that topic's `questions.json`.

### 9.2 Example Mapping

| Question | Mapped Topic |
|----------|-------------|
| Q1: "What is an algorithm?" | `topic_002_algorithms_problem_solving` |
| Q2–Q7: Time complexity | `topic_003_time_complexity` |
| Q8: Recursive function uses stack | `topic_004_space_complexity` (or recursion topic) – choose and be consistent |

### 9.3 Example (Q1 – Algorithm)

```json
[
  {
    "id": "q_002_algorithm_definition_mcq",
    "topicId": "topic_002_algorithms_problem_solving",
    "type": "MCQ",
    "question": "What is an algorithm?",
    "options": [
      { "id": "a", "text": "Programming language",                    "isCorrect": false, "order": 1 },
      { "id": "b", "text": "Set of instructions to solve a problem",  "isCorrect": true,  "order": 2 },
      { "id": "c", "text": "Hardware component",                      "isCorrect": false, "order": 3 },
      { "id": "d", "text": "Compiler",                                "isCorrect": false, "order": 4 }
    ],
    "correctAnswer": "b",
    "explanation": "An algorithm is a step-by-step procedure to solve a problem.",
    "difficulty": "beginner",
    "tags": ["algorithms", "basics"],
    "estimatedSeconds": 30,
    "status": "active",
    "version": 1
  }
]
```

> **Rules:**
> - `id` starts with `q_`
> - `topicId` must match the folder's topic
> - `options[].id` = `"a"`, `"b"`, `"c"`, `"d"`
> - `correctAnswer` = one of those IDs
> - Use `explanation` text from document where available
> - If no MCQ exists for a topic → create a TBD question entry with `status: "draft"`

---

## 10. Fill `practice.json` (TBD Allowed)

For now, keep practice mostly TBD but structured.

**Example (Time Complexity):**

```json
[
  {
    "id": "pp_time_complexity_tbd",
    "topicId": "topic_003_time_complexity",
    "title": "TBD – Identify time complexity of given code snippets",
    "description": "TBD – Provide small code snippets and ask learners to identify their time complexity.",
    "problemStatement": "TBD",
    "expectedSolution": "TBD",
    "solutionExplanation": "TBD",
    "steps": [],
    "difficulty": "beginner",
    "estimatedMinutes": 20,
    "tags": ["time-complexity"],
    "type": "quiz",
    "attemptsAllowed": "unlimited",
    "hintsEnabled": true,
    "status": "draft"
  }
]
```

> **Rule:** Always create `practice.json` with at least one TBD entry so the structure is ready.

---

## 11. Create Module Exams (Static)

**Path:** `content/courses/dsa_foundations/v1/exams/exam_dsa_module_01.json`

**Example for Module 1:**

```json
{
  "id": "exam_dsa_module_01",
  "type": "EXAM",
  "title": "DSA – Module 1: Programming & Analysis",
  "description": "Static exam for Programming Basics, Algorithms, Time & Space Complexity, and Asymptotic Notations.",
  "courseId": "course_dsa_foundations",
  "moduleId": "module_01_programming_analysis",
  "questions": [
    { "topicQuestionId": "q_002_algorithm_definition_mcq" },
    { "topicQuestionId": "q_003_time_complexity_definition" },
    { "topicQuestionId": "q_004_best_case_definition" },
    { "topicQuestionId": "q_005_worst_case_notation" },
    { "topicQuestionId": "q_006_single_loop_complexity" },
    { "topicQuestionId": "q_007_nested_loop_complexity" }
  ],
  "duration": 30,
  "totalQuestions": 6,
  "passingPercentage": 70,
  "attemptsAllowed": 3,
  "status": "active"
}
```

> **Rules:**
> - `questions[].topicQuestionId` must match IDs defined in `questions.json` of topics
> - Start with 5–10 questions per module

---

## 12. Mapping Checklist per Module

For each module, complete these steps:

- [ ] Create module folder and `module.json`
- [ ] List topics from the document under that module
- [ ] For each topic:
  - [ ] Create topic folder
  - [ ] Create `topic.json` with: `id`, `moduleId`, `title`, `slug`, `order`, `difficulty`
  - [ ] Create `summary.md` using 1–2 lines from the definition
  - [ ] Create `explanation.md` using definition, real-time example, and any extra explanation from document
  - [ ] Create `examples.json`:
    - If Java code present → add as example
    - Else → `[]` or a single TBD example
  - [ ] Create `questions.json` – map relevant MCQs from Q1–Q70; if none → create TBD question entry
  - [ ] Create `practice.json` – add at least one TBD practice item
- [ ] Create `exam_dsa_module_XX.json` referencing some of the topic questions

---

## 13. Naming Conventions Summary

| Artifact | Pattern | Example |
|----------|---------|---------|
| Course ID | `course_<slug>` | `course_dsa_foundations` |
| Module ID | `module_XX_<short_snake_case_title>` | `module_01_programming_analysis` |
| Topic ID | `topic_XXX_<short_snake_case_title>` | `topic_001_programming_basics` |
| Example ID | `ex_<short_name>` | `ex_algorithm_sum_two_numbers` |
| Question ID | `q_XXX_<short_name>` | `q_002_algorithm_definition_mcq` |
| Practice ID | `pp_<short_name>` | `pp_time_complexity_tbd` |
| Exam ID | `exam_dsa_module_XX` | `exam_dsa_module_01` |

> **Rule:** IDs are stable and never reused across different meanings.

---

## 14. What to Do When Data is Missing

If the document does not provide:

| Missing Data | Action |
|-------------|--------|
| Example | Put TBD example in `examples.json` |
| Question | Put TBD question in `questions.json` with `status: "draft"` |
| Practice | Put TBD practice in `practice.json` with `status: "draft"` |

> **Rule:** Always keep the file present so the structure is complete.

---

## 15. Final Sanity Checklist

Before committing:

- [ ] `course.json` exists and references the correct course ID
- [ ] `manifest.json` references correct `courseId` and `entryModuleId`
- [ ] 14 module folders exist with `module.json`
- [ ] Each module's `topics` array matches actual topic folders
- [ ] Each topic folder has:
  - [ ] `topic.json`
  - [ ] `summary.md`
  - [ ] `explanation.md`
  - [ ] `examples.json`
  - [ ] `questions.json`
  - [ ] `practice.json`
- [ ] All MCQ IDs in exams exist in topic `questions.json`
- [ ] No broken IDs (`moduleId`, `topicId`, `courseId`) across files

---

> Once this is done, this DSA course becomes the **Golden Example** for all future KlassMet courses.
