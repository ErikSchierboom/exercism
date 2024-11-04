pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let rows = input.len();
    let cols = if rows > 0 { input[0].len() } else { 0 };

    let mut row_maxes = vec![u64::MIN; rows];
    let mut col_mins = vec![u64::MAX; cols];

    for row in 0..rows {
        for col in 0..cols {
            row_maxes[row] = row_maxes[row].max(input[row][col]);
            col_mins[col] = col_mins[col].min(input[row][col]);
        }
    }

    let mut saddle_points: Vec<(usize, usize)> = Vec::new();
    for row in 0..rows {
        for col in 0..cols {
            if input[row][col] >= row_maxes[row] && input[row][col] <= col_mins[col] {
                saddle_points.push((row, col));
            }
        }
    }

    saddle_points
}
