## What is a 2D Array?

A 2D array is an **array of arrays** — it stores data in rows and columns (matrix form).

### Real-time Example

An Excel spreadsheet:
- Rows and columns form a grid
- Each cell is accessed by (row, column) index → arr[row][col]

### Java Example – 2D Array

```java
class TwoDArrayExample {
    public static void main(String[] args) {
        int[][] matrix = {
            {1, 2, 3},
            {4, 5, 6}
        };
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }
    }
}
```

Used to represent tables, grids, and matrices.

**Time Complexity: O(rows × cols)**  
**Space Complexity: O(rows × cols)**

### Common Use Cases

- Matrix multiplication
- Graph adjacency matrix
- Image pixel storage
- Dynamic programming tables
