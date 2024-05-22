pub fn egg_count(display_value: u32) -> usize {
    let mut count = 0usize;
    let mut remaining = display_value as usize;

    while remaining > 0 {
        count += remaining & 1;
        remaining >>= 1;
    }

    count
}
