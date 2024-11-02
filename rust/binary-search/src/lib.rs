use std::cmp::Ordering;

pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let mut left = 0;
    let mut right = array.len();

    while left < right {
        let middle = (left + right) / 2;
        match array[middle].cmp(&key) {
            Ordering::Less => left = middle + 1,
            Ordering::Equal => return Some(middle),
            Ordering::Greater => right = middle,
        }
    }

    None
}
