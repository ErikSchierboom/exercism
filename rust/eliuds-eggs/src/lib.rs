pub fn egg_count(display_value: u32) -> usize {
    let mut count = 0;
    let mut remaining = display_value;

    while remaining > 0 {
        count += remaining & 1;
        remaining >>= 1;
    }

    return count as usize;
}
