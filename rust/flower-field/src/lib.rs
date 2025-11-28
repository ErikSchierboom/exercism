const NEIGHBOR_OFFSETS: [(i8, i8); 8] = [
    (-1, -1),
    (-1, 0),
    (-1, 1),
    (0, -1),
    (0, 1),
    (1, -1),
    (1, 0),
    (1, 1),
];

pub fn annotate(garden: &[&str]) -> Vec<String> {
    garden
        .iter()
        .enumerate()
        .map(|(y, row)| {
            row.as_bytes()
                .iter()
                .enumerate()
                .map(move |(x, cell)| if *cell == b'*' { '*' } else {
                    let adjacent_flowers = NEIGHBOR_OFFSETS
                        .iter()
                        .filter(|(dy, dx)| {
                            garden
                                .get((y as i8 + dy) as usize)
                                .map(|r| r.as_bytes().get((x as i8 + dx) as usize)) == Some(Some(&b'*'))
                        })
                        .count();

                    if adjacent_flowers == 0 { ' ' } else { (adjacent_flowers as u8 + b'0') as char }
                })
                .collect::<String>()
        })
        .collect()
}
