pub fn spiral_matrix(size: u32) -> Vec<Vec<u32>> {
    match size {
        0 => vec![],
        1 => vec![vec![1]],
        _ => {
            let mut matrix = vec![vec![0; size as usize]; size as usize];
            let mut row_offset = 0usize;
            let mut col_offset = 0usize;
            let mut current_number = 1;
            let total_numbers = size * size;

            while current_number <= total_numbers {
                for top_col in col_offset..size as usize - col_offset {
                    matrix[row_offset][top_col] = current_number;
                    current_number += 1
                }

                for right_row in row_offset + 1..size as usize - row_offset {
                    matrix[right_row][size as usize - col_offset - 1] = current_number;
                    current_number += 1
                }

                for bottom_col in (col_offset..=size as usize - col_offset - 2).rev() {
                    matrix[size as usize - row_offset - 1][bottom_col] = current_number;
                    current_number += 1;
                }

                for left_row in ((row_offset + 1)..=size as usize - row_offset - 2).rev() {
                    matrix[left_row][col_offset] = current_number;
                    current_number += 1;
                }

                row_offset += 1;
                col_offset += 1;
            }

            matrix
        }
    }
}
