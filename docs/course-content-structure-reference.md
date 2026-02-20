# Course Content Structure Reference

Use this as a template when scaffolding any new course under `content/courses/`.

---

## Folder Structure Overview

```
content/
└── courses/
    └── <course_id>/
        └── <version>/               ← e.g. v1
            ├── course.json
            ├── manifest.json
            ├── modules/
            │   └── module_XX_<name>/
            │       ├── module.json
            │       └── topics/
            │           └── topic_XXX_<name>/
            │               ├── topic.json
            │               ├── summary.md
            │               ├── explanation.md
            │               ├── examples.json
            │               ├── questions.json
            │               └── practice.json
            ├── exams/
            │   └── exam_<course_id>_module_XX.json
            └── assets/              ← optional
```

---

## File Count Reference

| Category | Folder Path | Purpose / What It Contains | Count | Math |
|----------|-------------|----------------------------|-------|------|
| **Course Root Files** | `courses/<id>/<ver>/` | Base metadata for the course version | **2** | Fixed = 2 |
| ├── `course.json` | | Course title, description, level, estimated hours | | |
| └── `manifest.json` | | Quiz rules, entry module, version metadata | | |
| **Modules** | `modules/` | Contains all modules for the course | **14** | 14 modules × 1 file = 14 |
| `modules/module_XX_<name>/module.json` | | Module metadata: title, description, topic list | | |
| **Topics** | `modules/module_XX_<name>/topics/` | Contains all topics for that module | **420** | 70 topics × 6 files = 420 |
| `topic_XXX_<name>/topic.json` | | Topic metadata: id, order, difficulty, prerequisites, outcomes | | |
| `summary.md` | | 2–3 sentence overview with real-world analogy | | |
| `explanation.md` | | Full Markdown: concepts, Java code, tables, complexity analysis | | |
| `examples.json` | | Array of runnable Java code examples with explanations | | |
| `questions.json` | | MCQs mapped to question IDs from source content | | |
| `practice.json` | | Practice problem stubs (can be TBD placeholders) | | |
| **Module Exams** | `exams/` | Static exam per module | **14** | 14 modules × 1 exam = 14 |
| `exam_<course_id>_module_XX.json` | | References question IDs, passing score, duration | | |
| **Optional Assets** | `assets/` | Images, diagrams, PDFs | *(optional)* | *(optional)* |
| | | **Total (excluding assets)** | **450** | 2 + 14 + 420 + 14 = 450 |

---

## Naming Conventions

| Item | Pattern | Example |
|------|---------|---------|
| Course ID | `course_<name>` | `course_dsa_foundations` |
| Module folder | `module_XX_<snake_case>` | `module_03_searching_sorting` |
| Topic folder | `topic_XXX_<snake_case>` | `topic_022_recursion` |
| Question ID | `q_XXX_<descriptor>` | `q_051_heap_root_min` |
| Example ID | `ex_<descriptor>` | `ex_heap_sort` |
| Practice ID | `pp_<descriptor>` | `pp_bfs_shortest_path` |
| Exam file | `exam_<course_id>_module_XX.json` | `exam_dsa_module_07.json` |

> **Module numbers**: 2-digit zero-padded (`01`–`14`)  
> **Topic numbers**: 3-digit global counter across the entire course (`001`–`070`)

---

## Per-File Schema Summary

### `course.json`
```json
{
  "id": "course_<id>",
  "version": "v1",
  "title": "",
  "description": "",
  "level": "beginner_to_intermediate",
  "estimatedHours": 40,
  "language": "en",
  "modules": ["module_01_...", "..."]
}
```

### `manifest.json`
```json
{
  "courseId": "course_<id>",
  "version": "v1",
  "entryModule": "module_01_...",
  "dynamicQuizzesEnabled": true,
  "passingScore": 70
}
```

### `module.json`
```json
{
  "id": "module_XX_<name>",
  "courseId": "course_<id>",
  "title": "",
  "description": "",
  "order": 1,
  "topics": ["topic_XXX_...", "..."],
  "estimatedMinutes": 60
}
```

### `topic.json`
```json
{
  "id": "topic_XXX_<name>",
  "moduleId": "module_XX_<name>",
  "title": "",
  "slug": "",
  "order": 1,
  "difficulty": "beginner | intermediate | advanced",
  "tags": [],
  "estimatedMinutes": 20,
  "learningOutcomes": [],
  "prerequisites": [],
  "status": "active",
  "version": 1
}
```

### `examples.json`
```json
[
  {
    "id": "ex_<name>",
    "title": "",
    "description": "",
    "language": "java",
    "code": "",
    "explanation": "",
    "order": 1
  }
]
```

### `questions.json`
```json
[
  {
    "id": "q_XXX_<name>",
    "topicId": "topic_XXX_<name>",
    "type": "MCQ",
    "question": "",
    "options": [
      { "id": "a", "text": "", "isCorrect": false, "order": 1 },
      { "id": "b", "text": "", "isCorrect": true,  "order": 2 }
    ],
    "correctAnswer": "b",
    "explanation": "",
    "difficulty": "intermediate",
    "tags": [],
    "estimatedSeconds": 30,
    "status": "active",
    "version": 1
  }
]
```

### `practice.json`
```json
[
  {
    "id": "pp_<name>",
    "topicId": "topic_XXX_<name>",
    "title": "",
    "description": "",
    "problemStatement": "",
    "expectedSolution": "",
    "solutionExplanation": "",
    "steps": [],
    "difficulty": "intermediate",
    "estimatedMinutes": 20,
    "tags": [],
    "type": "coding",
    "attemptsAllowed": "unlimited",
    "hintsEnabled": true,
    "status": "draft"
  }
]
```

### `exam_<course>_module_XX.json`
```json
{
  "id": "exam_<course_id>_module_XX",
  "courseId": "course_<id>",
  "moduleId": "module_XX_<name>",
  "version": "v1",
  "title": "Module XX Exam – <Title>",
  "description": "",
  "type": "module_exam",
  "durationMinutes": 25,
  "passingScore": 70,
  "maxAttempts": 3,
  "questions": [
    { "questionId": "q_XXX_<name>", "topicId": "topic_XXX_<name>", "order": 1, "points": 1 }
  ],
  "totalPoints": 5,
  "status": "active",
  "version": 1
}
```
