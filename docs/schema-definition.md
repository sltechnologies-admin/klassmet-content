# KlassMet – Course Content Schema Definition

> **Purpose**: Team reference for understanding the complete data model, from `courseId` down to every leaf entity.  
> **Scope**: All courses under `content/courses/`.

---

## 1. Folder Structure

```
content/
└── courses/
    └── <course_id>/                          ← e.g. course_dsa_foundations
        └── <version>/                        ← e.g. v1, v2 etc.
            ├── course.json                   ← Course root metadata
            ├── manifest.json                 ← Runtime config & feature flags
            ├── modules/
            │   └── module_XX_<name>/         ← e.g. module_03_searching_sorting
            │       ├── module.json           ← Module metadata
            │       └── topics/
            │           └── topic_XXX_<name>/ ← e.g. topic_022_recursion
            │               ├── topic.json    ← Topic metadata
            │               ├── summary.md    ← Short overview (2–3 sentences)
            │               ├── explanation.md← Full explanation + code
            │               ├── examples.json ← Runnable code examples
            │               ├── questions.json← MCQs (question bank)
            │               └── practice.json ← Practice problems
            ├── exams/
            │   └── exam_<course_id>_module_XX.json  ← Module exam config
            └── assets/                       ← (optional) images, diagrams, PDFs
```

---

## 2. Entity Relationship

```
course_id
  │
  ├── has many ──▶ modules (module_id)
  │                  │
  │                  ├── has many ──▶ topics (topic_id)
  │                  │                  │
  │                  │                  ├── topic.json
  │                  │                  ├── summary.md
  │                  │                  ├── explanation.md
  │                  │                  ├── examples.json   [ ]  array of ex_*
  │                  │                  ├── questions.json  [ ]  array of q_*
  │                  │                  └── practice.json   [ ]  array of pp_*
  │                  │
  │                  └── has one ────▶ exam (exam_id)
  │                                     └── references q_* from questions.json
  │
  └── has one ────▶ manifest.json  (runtime config)
```

---

## 3. Naming Conventions

| Entity | Pattern | Example |
|--------|---------|---------|
| Course ID | `course_<snake_case>` | `course_dsa_foundations` |
| Version folder | `v<n>` | `v1` |
| Module folder | `module_XX_<snake_case>` | `module_03_searching_sorting` |
| Topic folder | `topic_XXX_<snake_case>` | `topic_022_recursion` |
| Question ID | `q_XXX_<descriptor>` | `q_051_heap_root_min` |
| Example ID | `ex_<descriptor>` | `ex_heap_sort` |
| Practice ID | `pp_<descriptor>` | `pp_bfs_shortest_path` |
| Exam file | `exam_<course_id>_module_XX.json` | `exam_dsa_module_07.json` |

> Module numbers: 2-digit zero-padded (`01`–`14`)  
> Topic numbers: 3-digit **global** counter across the entire course (`001`–`070`)

---

## 4. Schema Definitions

---

### 4.1 `course.json`
Root identity and display metadata for a course version.

```json
{
  "id": "course_dsa_foundations",
  "slug": "dsa-foundations",
  "title": "DSA Foundations – From Basics to Advanced",
  "description": "Full course description.",
  "level": "beginner_to_intermediate",
  "estimatedHours": 40,
  "language": "en",
  "status": "active",
  "version": 1
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | Unique course identifier |
| `slug` | string | ✅ | URL-safe name |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | Short course description |
| `level` | string | ✅ | `beginner` \| `beginner_to_intermediate` \| `advanced` |
| `estimatedHours` | number | ✅ | Total learning hours |
| `language` | string | ✅ | Locale code, e.g. `en`, `en-IN` |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

### 4.2 `manifest.json`
Runtime configuration: feature flags, quiz defaults, entry point.

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

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `courseId` | string | ✅ | Links to `course.json` `id` |
| `entryModuleId` | string | ✅ | First module to load |
| `defaultLocale` | string | ✅ | e.g. `en-IN` |
| `features` | object | ✅ | Feature flag toggles |
| `quizDefaults` | object | ✅ | Dynamic quiz generation rules |

---

### 4.3 `module.json`
Metadata for a single module, including its ordered topic list.

```json
{
  "id": "module_03_searching_sorting",
  "courseId": "course_dsa_foundations",
  "title": "Searching & Sorting",
  "description": "Linear/binary search and all major sorting algorithms.",
  "order": 3,
  "topics": [
    "topic_012_linear_search",
    "topic_013_binary_search"
  ],
  "estimatedMinutes": 90
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `module_XX_<name>` |
| `courseId` | string | ✅ | Parent course reference |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | Module summary |
| `order` | number | ✅ | Display/progression order |
| `topics` | string[] | ✅ | Ordered list of topic IDs |
| `estimatedMinutes` | number | ✅ | Total module time |

---

### 4.4 `topic.json`
Metadata for a single topic within a module.

```json
{
  "id": "topic_022_recursion",
  "moduleId": "module_04_recursion_backtracking",
  "title": "Recursion",
  "slug": "recursion",
  "order": 1,
  "difficulty": "intermediate",
  "tags": ["recursion", "call-stack"],
  "estimatedMinutes": 20,
  "learningOutcomes": [
    "Define base case and recursive case.",
    "Trace a recursive call stack."
  ],
  "prerequisites": ["topic_001_programming_basics"],
  "status": "active",
  "version": 1
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `topic_XXX_<name>` |
| `moduleId` | string | ✅ | Parent module reference |
| `title` | string | ✅ | Display title |
| `slug` | string | ✅ | URL-safe name |
| `order` | number | ✅ | Order within the module |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `tags` | string[] | ✅ | Search/filter tags |
| `estimatedMinutes` | number | ✅ | Time to complete topic |
| `learningOutcomes` | string[] | ✅ | What the learner will achieve |
| `prerequisites` | string[] | ✅ | Topic IDs that must precede this |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

### 4.5 `summary.md`
A 2–3 sentence plain-language overview of the topic, ideally with a real-world analogy.

```markdown
A stack is a last-in-first-out (LIFO) structure — like a stack of plates
where you always add and remove from the top. Java's `Deque` interface
(via `ArrayDeque`) is the preferred stack implementation.
```

---

### 4.6 `explanation.md`
Full topic explanation in Markdown: concepts, Java code blocks, tables, and complexity analysis.

```markdown
## Stack – Basics

A stack supports three operations: push, pop, and peek.

### Java Implementation

​```java
Deque<Integer> stack = new ArrayDeque<>();
stack.push(1);
stack.push(2);
System.out.println(stack.pop()); // 2
​```

### Complexity

| Operation | Time | Space |
|-----------|------|-------|
| push      | O(1) | O(1)  |
| pop       | O(1) | O(1)  |
```

---

### 4.7 `examples.json`
Array of runnable code examples, each self-contained and independently executable.

```json
[
  {
    "id": "ex_stack_basic",
    "title": "Stack – Push and Pop",
    "description": "Demonstrates push, pop, and peek on a Java ArrayDeque.",
    "language": "java",
    "code": "Deque<Integer> stack = new ArrayDeque<>();\nstack.push(1);\nSystem.out.println(stack.pop());",
    "explanation": "push() adds to the top, pop() removes from the top (LIFO).",
    "order": 1
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `ex_<descriptor>` |
| `title` | string | ✅ | Short display title |
| `description` | string | ✅ | What this example demonstrates |
| `language` | string | ✅ | Always `java` for this course |
| `code` | string | ✅ | Full runnable code |
| `explanation` | string | ✅ | What to observe in output |
| `order` | number | ✅ | Display order |

---

### 4.8 `questions.json`
MCQ question bank for the topic. Used both by dynamic quizzes and referenced by exams.

```json
[
  {
    "id": "q_028_stack_lifo",
    "topicId": "topic_028_stack_basics",
    "type": "MCQ",
    "question": "A stack follows which principle?",
    "options": [
      { "id": "a", "text": "FIFO", "isCorrect": false, "order": 1 },
      { "id": "b", "text": "LIFO", "isCorrect": true,  "order": 2 },
      { "id": "c", "text": "Random", "isCorrect": false, "order": 3 },
      { "id": "d", "text": "Priority", "isCorrect": false, "order": 4 }
    ],
    "correctAnswer": "b",
    "explanation": "Stack = Last In First Out. The last element pushed is the first popped.",
    "difficulty": "beginner",
    "tags": ["stack", "lifo"],
    "estimatedSeconds": 30,
    "status": "active",
    "version": 1
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `q_XXX_<descriptor>` |
| `topicId` | string | ✅ | Parent topic reference |
| `type` | string | ✅ | `MCQ` (extensible to `true_false`, `short_answer`) |
| `question` | string | ✅ | Question text |
| `options` | object[] | ✅ | 4 options; exactly one `isCorrect: true` |
| `correctAnswer` | string | ✅ | Option `id` of the correct answer |
| `explanation` | string | ✅ | Why the answer is correct |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `tags` | string[] | ✅ | For dynamic quiz filtering |
| `estimatedSeconds` | number | ✅ | Expected time to answer |
| `status` | string | ✅ | `active` \| `draft` |
| `version` | number | ✅ | Schema revision number |

---

### 4.9 `practice.json`
Practice problem stubs. May be `"status": "draft"` with `"TBD"` placeholders initially.

```json
[
  {
    "id": "pp_stack_balanced_parens",
    "topicId": "topic_028_stack_basics",
    "title": "Balanced Parentheses Checker",
    "description": "Use a stack to validate bracket pairs in a string.",
    "problemStatement": "Given a string of brackets, return true if balanced.",
    "expectedSolution": "Push open brackets; pop on matching close. Return stack.isEmpty() at end.",
    "solutionExplanation": "Stack naturally tracks unmatched opens. O(n) time, O(n) space.",
    "steps": [
      "Iterate each character",
      "Push if open bracket",
      "Pop and match if close bracket",
      "Return true if stack is empty"
    ],
    "difficulty": "intermediate",
    "estimatedMinutes": 20,
    "tags": ["stack", "strings"],
    "type": "coding",
    "attemptsAllowed": "unlimited",
    "hintsEnabled": true,
    "status": "active"
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `pp_<descriptor>` |
| `topicId` | string | ✅ | Parent topic reference |
| `title` | string | ✅ | Problem title |
| `description` | string | ✅ | One-line summary |
| `problemStatement` | string | ✅ | Full problem description |
| `expectedSolution` | string | ✅ | High-level solution approach |
| `solutionExplanation` | string | ✅ | Complexity + rationale |
| `steps` | string[] | ✅ | Step-by-step hints |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `estimatedMinutes` | number | ✅ | Expected solve time |
| `type` | string | ✅ | `coding` \| `conceptual` |
| `attemptsAllowed` | string | ✅ | `unlimited` or a number |
| `hintsEnabled` | boolean | ✅ | Show/hide hints |
| `status` | string | ✅ | `active` \| `draft` |

---

### 4.10 `exam_<course_id>_module_XX.json`
Module exam config. References `q_*` IDs from `questions.json` — does **not** duplicate question content.

```json
{
  "id": "exam_dsa_module_07",
  "courseId": "course_dsa_foundations",
  "moduleId": "module_07_hashing",
  "title": "Module 07 Exam – Hashing",
  "description": "Assessment covering hash tables, collision resolution, load factor, and applications.",
  "type": "module_exam",
  "durationMinutes": 25,
  "passingScore": 70,
  "maxAttempts": 3,
  "questions": [
    { "questionId": "q_036_hash_function", "topicId": "topic_036_hash_table", "order": 1, "points": 1 },
    { "questionId": "q_037_collision_chaining", "topicId": "topic_037_collision_resolution", "order": 2, "points": 1 }
  ],
  "totalPoints": 5,
  "status": "active",
  "version": 1
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `exam_<course_id>_module_XX` |
| `courseId` | string | ✅ | Parent course reference |
| `moduleId` | string | ✅ | Module this exam belongs to |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | What topics are assessed |
| `type` | string | ✅ | `module_exam` \| `final_exam` \| `practice_exam` |
| `durationMinutes` | number | ✅ | Time limit |
| `passingScore` | number | ✅ | Percentage required to pass (per-exam, not global) |
| `maxAttempts` | number | ✅ | Retry limit |
| `questions` | object[] | ✅ | Ordered list of question references |
| `questions[].questionId` | string | ✅ | References `id` in `questions.json` |
| `questions[].topicId` | string | ✅ | Avoids secondary lookup when building exam view |
| `questions[].order` | number | ✅ | Display order in exam |
| `questions[].points` | number | ✅ | Score weight |
| `totalPoints` | number | ✅ | Sum of all question points |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

## 5. File Count Summary

| Category | Count | Math |
|----------|-------|------|
| Course root files (`course.json`, `manifest.json`) | 2 | Fixed |
| Module files (`module.json` × 14) | 14 | 14 × 1 |
| Topic files (6 files × 70 topics) | 420 | 70 × 6 |
| Exam files | 14 | 14 × 1 |
| **Total** | **450** | 2 + 14 + 420 + 14 |

---

## 6. Key Design Rules

1. **No content duplication** — exam files reference question IDs only; full question content lives exclusively in `questions.json`.
2. **`courseId` on every entity** — enables backend lookups without parsing file paths.
3. **Global topic numbering** — topic IDs are globally unique across the course (not per-module), simplifying cross-module prerequisites.
4. **`status` on every entity** — allows individual files to be in `draft` while the course is `active`.
5. **`version` (number) on every entity** — tracks schema changes for cache busting and migrations. Never use a string version (`"v1"`) — that is encoded in the folder path.
6. **`passingScore` per exam, not global** — allows per-module difficulty tuning without touching other exams.
7. **`practice.json` may be stubbed** — `"status": "draft"` with `"TBD"` values is valid during initial content build.

---

## 1. Folder Structure

```
content/
└── courses/
    └── <course_id>/                          ← e.g. course_dsa_foundations
        └── <version>/                        ← e.g. v1
            ├── course.json                   ← Course root metadata
            ├── manifest.json                 ← Runtime config & feature flags
            ├── modules/
            │   └── module_XX_<name>/         ← e.g. module_03_searching_sorting
            │       ├── module.json           ← Module metadata
            │       └── topics/
            │           └── topic_XXX_<name>/ ← e.g. topic_022_recursion
            │               ├── topic.json    ← Topic metadata
            │               ├── summary.md    ← Short overview (2–3 sentences)
            │               ├── explanation.md← Full explanation + code
            │               ├── examples.json ← Runnable code examples
            │               ├── questions.json← MCQs (question bank)
            │               └── practice.json ← Practice problems
            ├── exams/
            │   └── exam_<course_id>_module_XX.json  ← Module exam config
            └── assets/                       ← (optional) images, diagrams, PDFs
```

---

## 2. Entity Relationship

```
course_id
  │
  ├── has many ──▶ modules (module_id)
  │                  │
  │                  ├── has many ──▶ topics (topic_id)
  │                  │                  │
  │                  │                  ├── topic.json
  │                  │                  ├── summary.md
  │                  │                  ├── explanation.md
  │                  │                  ├── examples.json   [ ]  array of ex_*
  │                  │                  ├── questions.json  [ ]  array of q_*
  │                  │                  └── practice.json   [ ]  array of pp_*
  │                  │
  │                  └── has one ────▶ exam (exam_id)
  │                                     └── references q_* from questions.json
  │
  └── has one ────▶ manifest.json  (runtime config)
```

---

## 3. Naming Conventions

| Entity | Pattern | Example |
|--------|---------|---------|
| Course ID | `course_<snake_case>` | `course_dsa_foundations` |
| Version folder | `v<n>` | `v1` |
| Module folder | `module_XX_<snake_case>` | `module_03_searching_sorting` |
| Topic folder | `topic_XXX_<snake_case>` | `topic_022_recursion` |
| Question ID | `q_XXX_<descriptor>` | `q_051_heap_root_min` |
| Example ID | `ex_<descriptor>` | `ex_heap_sort` |
| Practice ID | `pp_<descriptor>` | `pp_bfs_shortest_path` |
| Exam file | `exam_<course_id>_module_XX.json` | `exam_dsa_module_07.json` |

> Module numbers: 2-digit zero-padded (`01`–`14`)  
> Topic numbers: 3-digit **global** counter across the entire course (`001`–`070`)

---

## 4. Schema Definitions

---

### 4.1 `course.json`
Root identity and display metadata for a course version.

```json
{
  "id": "course_dsa_foundations",
  "slug": "dsa-foundations",
  "title": "DSA Foundations – From Basics to Advanced",
  "description": "Full course description.",
  "level": "beginner_to_intermediate",
  "estimatedHours": 40,
  "language": "en",
  "status": "active",
  "version": 1
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | Unique course identifier |
| `slug` | string | ✅ | URL-safe name |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | Short course description |
| `level` | string | ✅ | `beginner` \| `beginner_to_intermediate` \| `advanced` |
| `estimatedHours` | number | ✅ | Total learning hours |
| `language` | string | ✅ | Locale code, e.g. `en`, `en-IN` |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

### 4.2 `manifest.json`
Runtime configuration: feature flags, quiz defaults, entry point.

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

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `courseId` | string | ✅ | Links to `course.json` `id` |
| `entryModuleId` | string | ✅ | First module to load |
| `defaultLocale` | string | ✅ | e.g. `en-IN` |
| `features` | object | ✅ | Feature flag toggles |
| `quizDefaults` | object | ✅ | Dynamic quiz generation rules |

---

### 4.3 `module.json`
Metadata for a single module, including its ordered topic list.

```json
{
  "id": "module_03_searching_sorting",
  "courseId": "course_dsa_foundations",
  "title": "Searching & Sorting",
  "description": "Linear/binary search and all major sorting algorithms.",
  "order": 3,
  "topics": [
    "topic_012_linear_search",
    "topic_013_binary_search"
  ],
  "estimatedMinutes": 90
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `module_XX_<name>` |
| `courseId` | string | ✅ | Parent course reference |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | Module summary |
| `order` | number | ✅ | Display/progression order |
| `topics` | string[] | ✅ | Ordered list of topic IDs |
| `estimatedMinutes` | number | ✅ | Total module time |

---

### 4.4 `topic.json`
Metadata for a single topic within a module.

```json
{
  "id": "topic_022_recursion",
  "moduleId": "module_04_recursion_backtracking",
  "title": "Recursion",
  "slug": "recursion",
  "order": 1,
  "difficulty": "intermediate",
  "tags": ["recursion", "call-stack"],
  "estimatedMinutes": 20,
  "learningOutcomes": [
    "Define base case and recursive case.",
    "Trace a recursive call stack."
  ],
  "prerequisites": ["topic_001_programming_basics"],
  "status": "active",
  "version": 1
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `topic_XXX_<name>` |
| `moduleId` | string | ✅ | Parent module reference |
| `title` | string | ✅ | Display title |
| `slug` | string | ✅ | URL-safe name |
| `order` | number | ✅ | Order within the module |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `tags` | string[] | ✅ | Search/filter tags |
| `estimatedMinutes` | number | ✅ | Time to complete topic |
| `learningOutcomes` | string[] | ✅ | What the learner will achieve |
| `prerequisites` | string[] | ✅ | Topic IDs that must precede this |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

### 4.5 `summary.md`
A 2–3 sentence plain-language overview of the topic, ideally with a real-world analogy.

```markdown
A stack is a last-in-first-out (LIFO) structure — like a stack of plates
where you always add and remove from the top. Java's `Deque` interface
(via `ArrayDeque`) is the preferred stack implementation.
```

---

### 4.6 `explanation.md`
Full topic explanation in Markdown: concepts, Java code blocks, tables, and complexity analysis.

```markdown
## Stack – Basics

A stack supports three operations: push, pop, and peek.

### Java Implementation

​```java
Deque<Integer> stack = new ArrayDeque<>();
stack.push(1);
stack.push(2);
System.out.println(stack.pop()); // 2
​```

### Complexity

| Operation | Time | Space |
|-----------|------|-------|
| push      | O(1) | O(1)  |
| pop       | O(1) | O(1)  |
```

---

### 4.7 `examples.json`
Array of runnable code examples, each self-contained and independently executable.

```json
[
  {
    "id": "ex_stack_basic",
    "title": "Stack – Push and Pop",
    "description": "Demonstrates push, pop, and peek on a Java ArrayDeque.",
    "language": "java",
    "code": "Deque<Integer> stack = new ArrayDeque<>();\nstack.push(1);\nSystem.out.println(stack.pop());",
    "explanation": "push() adds to the top, pop() removes from the top (LIFO).",
    "order": 1
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `ex_<descriptor>` |
| `title` | string | ✅ | Short display title |
| `description` | string | ✅ | What this example demonstrates |
| `language` | string | ✅ | Always `java` for this course |
| `code` | string | ✅ | Full runnable code |
| `explanation` | string | ✅ | What to observe in output |
| `order` | number | ✅ | Display order |

---

### 4.8 `questions.json`
MCQ question bank for the topic. Used both by dynamic quizzes and referenced by exams.

```json
[
  {
    "id": "q_028_stack_lifo",
    "topicId": "topic_028_stack_basics",
    "type": "MCQ",
    "question": "A stack follows which principle?",
    "options": [
      { "id": "a", "text": "FIFO", "isCorrect": false, "order": 1 },
      { "id": "b", "text": "LIFO", "isCorrect": true,  "order": 2 },
      { "id": "c", "text": "Random", "isCorrect": false, "order": 3 },
      { "id": "d", "text": "Priority", "isCorrect": false, "order": 4 }
    ],
    "correctAnswer": "b",
    "explanation": "Stack = Last In First Out. The last element pushed is the first popped.",
    "difficulty": "beginner",
    "tags": ["stack", "lifo"],
    "estimatedSeconds": 30,
    "status": "active",
    "version": 1
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `q_XXX_<descriptor>` |
| `topicId` | string | ✅ | Parent topic reference |
| `type` | string | ✅ | `MCQ` (extensible to `true_false`, `short_answer`) |
| `question` | string | ✅ | Question text |
| `options` | object[] | ✅ | 4 options; exactly one `isCorrect: true` |
| `correctAnswer` | string | ✅ | Option `id` of the correct answer |
| `explanation` | string | ✅ | Why the answer is correct |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `tags` | string[] | ✅ | For dynamic quiz filtering |
| `estimatedSeconds` | number | ✅ | Expected time to answer |
| `status` | string | ✅ | `active` \| `draft` |
| `version` | number | ✅ | Schema revision number |

---

### 4.9 `practice.json`
Practice problem stubs. May be `"status": "draft"` with `"TBD"` placeholders initially.

```json
[
  {
    "id": "pp_stack_balanced_parens",
    "topicId": "topic_028_stack_basics",
    "title": "Balanced Parentheses Checker",
    "description": "Use a stack to validate bracket pairs in a string.",
    "problemStatement": "Given a string of brackets, return true if balanced.",
    "expectedSolution": "Push open brackets; pop on matching close. Return stack.isEmpty() at end.",
    "solutionExplanation": "Stack naturally tracks unmatched opens. O(n) time, O(n) space.",
    "steps": [
      "Iterate each character",
      "Push if open bracket",
      "Pop and match if close bracket",
      "Return true if stack is empty"
    ],
    "difficulty": "intermediate",
    "estimatedMinutes": 20,
    "tags": ["stack", "strings"],
    "type": "coding",
    "attemptsAllowed": "unlimited",
    "hintsEnabled": true,
    "status": "active"
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `pp_<descriptor>` |
| `topicId` | string | ✅ | Parent topic reference |
| `title` | string | ✅ | Problem title |
| `description` | string | ✅ | One-line summary |
| `problemStatement` | string | ✅ | Full problem description |
| `expectedSolution` | string | ✅ | High-level solution approach |
| `solutionExplanation` | string | ✅ | Complexity + rationale |
| `steps` | string[] | ✅ | Step-by-step hints |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `estimatedMinutes` | number | ✅ | Expected solve time |
| `type` | string | ✅ | `coding` \| `conceptual` |
| `attemptsAllowed` | string | ✅ | `unlimited` or a number |
| `hintsEnabled` | boolean | ✅ | Show/hide hints |
| `status` | string | ✅ | `active` \| `draft` |

---

### 4.10 `exam_<course_id>_module_XX.json`
Module exam config. References `q_*` IDs from `questions.json` — does **not** duplicate question content.

```json
{
  "id": "exam_dsa_module_07",
  "courseId": "course_dsa_foundations",
  "moduleId": "module_07_hashing",
  "title": "Module 07 Exam – Hashing",
  "description": "Assessment covering hash tables, collision resolution, load factor, and applications.",
  "type": "module_exam",
  "durationMinutes": 25,
  "passingScore": 70,
  "maxAttempts": 3,
  "questions": [
    { "questionId": "q_036_hash_function", "topicId": "topic_036_hash_table", "order": 1, "points": 1 },
    { "questionId": "q_037_collision_chaining", "topicId": "topic_037_collision_resolution", "order": 2, "points": 1 }
  ],
  "totalPoints": 5,
  "status": "active",
  "version": 1
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `exam_<course_id>_module_XX` |
| `courseId` | string | ✅ | Parent course reference |
| `moduleId` | string | ✅ | Module this exam belongs to |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | What topics are assessed |
| `type` | string | ✅ | `module_exam` \| `final_exam` \| `practice_exam` |
| `durationMinutes` | number | ✅ | Time limit |
| `passingScore` | number | ✅ | Percentage required to pass |
| `maxAttempts` | number | ✅ | Retry limit |
| `questions` | object[] | ✅ | Ordered list of question references |
| `questions[].questionId` | string | ✅ | References `id` in `questions.json` |
| `questions[].topicId` | string | ✅ | Avoids secondary lookup |
| `questions[].order` | number | ✅ | Display order in exam |
| `questions[].points` | number | ✅ | Score weight |
| `totalPoints` | number | ✅ | Sum of all question points |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

## 5. File Count Summary

| Category | Count | Math |
|----------|-------|------|
| Course root files (`course.json`, `manifest.json`) | 2 | Fixed |
| Module files (`module.json` × 14) | 14 | 14 × 1 |
| Topic files (6 files × 70 topics) | 420 | 70 × 6 |
| Exam files | 14 | 14 × 1 |
| **Total** | **450** | 2 + 14 + 420 + 14 |

---

## 6. Key Design Rules

1. **No content duplication** — exam files reference question IDs only; full question content lives exclusively in `questions.json`.
2. **courseId on every entity** — enables backend lookups without parsing file paths.
3. **Global topic numbering** — topic IDs are globally unique across the course (not per-module), simplifying cross-module prerequisites.
4. **status on every entity** — allows individual files to be in `draft` while the course is `active`.
5. **version (number) on every entity** — tracks schema changes for cache busting and migrations.
6. **practice.json may be stubbed** — `"status": "draft"` with `"TBD"` values is valid during initial build.
 1
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `q_XXX_<descriptor>` |
| `topicId` | string | ✅ | Parent topic reference |
| `type` | string | ✅ | `MCQ` (extensible to `true_false`, `short_answer`) |
| `question` | string | ✅ | Question text |
| `options` | object[] | ✅ | 4 options; exactly one `isCorrect: true` |
| `correctAnswer` | string | ✅ | Option `id` of the correct answer |
| `explanation` | string | ✅ | Why the answer is correct |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `tags` | string[] | ✅ | For dynamic quiz filtering |
| `estimatedSeconds` | number | ✅ | Expected time to answer |
| `status` | string | ✅ | `active` \| `draft` |
| `version` | number | ✅ | Schema revision number |

---

### 4.9 `practice.json`
Practice problem stubs. May be `"status": "draft"` with `"TBD"` placeholders initially.

```json
[
  {
    "id": "pp_stack_balanced_parens",
    "topicId": "topic_028_stack_basics",
    "title": "Balanced Parentheses Checker",
    "description": "Use a stack to validate bracket pairs in a string.",
    "problemStatement": "Given a string of brackets, return true if balanced.",
    "expectedSolution": "Push open brackets; pop on matching close. Return stack.isEmpty() at end.",
    "solutionExplanation": "Stack naturally tracks unmatched opens. O(n) time, O(n) space.",
    "steps": [
      "Iterate each character",
      "Push if open bracket",
      "Pop and match if close bracket",
      "Return true if stack is empty"
    ],
    "difficulty": "intermediate",
    "estimatedMinutes": 20,
    "tags": ["stack", "strings"],
    "type": "coding",
    "attemptsAllowed": "unlimited",
    "hintsEnabled": true,
    "status": "active"
  }
]
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `pp_<descriptor>` |
| `topicId` | string | ✅ | Parent topic reference |
| `title` | string | ✅ | Problem title |
| `description` | string | ✅ | One-line summary |
| `problemStatement` | string | ✅ | Full problem description |
| `expectedSolution` | string | ✅ | High-level solution approach |
| `solutionExplanation` | string | ✅ | Complexity + rationale |
| `steps` | string[] | ✅ | Step-by-step hints |
| `difficulty` | string | ✅ | `beginner` \| `intermediate` \| `advanced` |
| `estimatedMinutes` | number | ✅ | Expected solve time |
| `type` | string | ✅ | `coding` \| `conceptual` |
| `attemptsAllowed` | string | ✅ | `unlimited` or a number |
| `hintsEnabled` | boolean | ✅ | Show/hide hints |
| `status` | string | ✅ | `active` \| `draft` |

---

### 4.10 `exam_<course_id>_module_XX.json`
Module exam config. References `q_*` IDs from `questions.json` — does **not** duplicate question content.

```json
{
  "id": "exam_dsa_module_07",
  "courseId": "course_dsa_foundations",
  "moduleId": "module_07_hashing",
  "title": "Module 07 Exam – Hashing",
  "description": "Assessment covering hash tables, collision resolution, load factor, and applications.",
  "type": "module_exam",
  "durationMinutes": 25,
  "passingScore": 70,
  "maxAttempts": 3,
  "questions": [
    { "questionId": "q_036_hash_function", "topicId": "topic_036_hash_table", "order": 1, "points": 1 },
    { "questionId": "q_037_collision_chaining", "topicId": "topic_037_collision_resolution", "order": 2, "points": 1 }
  ],
  "totalPoints": 5,
  "status": "active"
}
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | ✅ | `exam_<course_id>_module_XX` |
| `courseId` | string | ✅ | Parent course reference |
| `moduleId` | string | ✅ | Module this exam belongs to |
| `title` | string | ✅ | Display title |
| `description` | string | ✅ | What topics are assessed |
| `type` | string | ✅ | `module_exam` \| `final_exam` \| `practice_exam` |
| `durationMinutes` | number | ✅ | Time limit |
| `passingScore` | number | ✅ | Percentage required to pass |
| `maxAttempts` | number | ✅ | Retry limit |
| `questions` | object[] | ✅ | Ordered list of question references |
| `questions[].questionId` | string | ✅ | References `id` in `questions.json` |
| `questions[].topicId` | string | ✅ | Avoids secondary lookup |
| `questions[].order` | number | ✅ | Display order in exam |
| `questions[].points` | number | ✅ | Score weight |
| `totalPoints` | number | ✅ | Sum of all question points |
| `status` | string | ✅ | `active` \| `draft` \| `archived` |
| `version` | number | ✅ | Schema revision number |

---

## 5. File Count Summary

| Category | Count | Math |
|----------|-------|------|
| Course root files (`course.json`, `manifest.json`) | 2 | Fixed |
| Module files (`module.json` × 14) | 14 | 14 × 1 |
| Topic files (6 files × 70 topics) | 420 | 70 × 6 |
| Exam files | 14 | 14 × 1 |
| **Total** | **450** | 2 + 14 + 420 + 14 |

---

## 6. Key Design Rules

1. **No content duplication** — exam files reference question IDs only; full question content lives exclusively in `questions.json`.
2. **courseId on every entity** — enables backend lookups without parsing file paths.
3. **Global topic numbering** — topic IDs are globally unique across the course (not per-module), simplifying cross-module prerequisites.
4. **status on every entity** — allows individual files to be in `draft` while the course is `active`.
5. **version (number) on every entity** — tracks schema changes for cache busting and migrations.
6. **practice.json may be stubbed** — `"status": "draft"` with `"TBD"` values is valid during initial build.
