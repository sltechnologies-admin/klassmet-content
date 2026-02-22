## What is an Algorithm?

An algorithm is a finite set of steps to solve a problem.

It is **not** a programming language or hardware — it is the logic or procedure behind the solution.

### Real-time Example

A recipe for cooking food:

1. Gather ingredients
2. Chop vegetables
3. Heat oil
4. Add spices
5. Cook for 10 minutes

This is an algorithm in real life: a clear, ordered sequence of steps.

In programming, algorithms are implemented using code, but the algorithm itself is language-agnostic.

### Properties of a Good Algorithm

- **Finiteness** – Must terminate after a finite number of steps.
- **Definiteness** – Each step must be clear and unambiguous.
- **Input** – Takes zero or more inputs.
- **Output** – Produces at least one output.
- **Effectiveness** – Every step must be basic enough to be carried out.

### Java Example – Sum of Two Numbers

```java
class AlgorithmExample {
    public static void main(String[] args) {
        int a = 10;
        int b = 20;
        int sum = a + b;
        System.out.println(sum);
    }
}
```

**Algorithm Steps:**
1. Take inputs a and b
2. Add them to get sum
3. Print the result
