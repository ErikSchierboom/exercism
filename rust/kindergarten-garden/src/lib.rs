const STUDENTS: [&str; 12] = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry",
];

pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {
    let idx = student_idx(student);

    diagram
        .split_whitespace()
        .flat_map(|line|
            line[idx * 2..idx * 2 +2]
                .chars()
                .map(|encoding| plant(encoding)))
        .collect()
}

fn plant(encoding: char) -> &'static str {
    match encoding {
        'G' => "grass",
        'V' => "violets",
        'C' => "clover",
        'R' => "radishes",
        _ => panic!("Invalid plant")
    }
}

fn student_idx(student: &str) -> usize {
    STUDENTS
        .iter()
        .position(|&name| name == student)
        .unwrap()
}
