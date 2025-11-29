pub struct PascalsTriangle {
    row_count: u32,
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self { Self { row_count } }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        (1..=self.row_count)
            .map(|row| {
                (0..row)
                    .scan(1u32, move |state, j| {
                        let val = *state;
                        *state = (*state) * ((row - 1) - j) / (j + 1);
                        Some(val)
                    })
                    .collect()
            })
            .collect()
    }
}
