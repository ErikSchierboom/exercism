pub struct Matrix {
    cells: Vec<Vec<u32>>
}

impl Matrix {
    pub fn new(input: &str) -> Self {
        let cells = input
            .lines()
            .map(|line| line.split_whitespace().map(|word| word.parse().unwrap()).collect())
            .collect();
        Self { cells }
    }

    pub fn row(&self, row_no: usize) -> Option<Vec<u32>> {
        self.cells.get(row_no - 1).cloned()
    }

    pub fn column(&self, col_no: usize) -> Option<Vec<u32>> {
        self.cells.iter().map(|r| r.get(col_no - 1).cloned()).collect()
    }
}
