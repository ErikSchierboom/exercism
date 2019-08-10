pub fn sing(start: i32, end: i32) -> String {
    (end..=start)
        .rev()
        .map(|n| verse(n))
        .collect::<Vec<_>>()
        .join("\n")
}

pub fn verse(n: i32) -> String {
    format!("{}{}", verse_first_line(n), verse_second_line(n))
}

fn verse_first_line(n: i32) -> String {
    format!(
        "{} on the wall, {}.\n",
        bottles_of_beer(n),
        bottles_of_beer(n).to_lowercase()
    )
}

fn verse_second_line(n: i32) -> String {
    format!(
        "{}, {} on the wall.\n",
        instruction(n),
        bottles_of_beer(if n == 0 { 99 } else { n - 1 }).to_lowercase()
    )
}

fn bottles_of_beer(count: i32) -> String {
    match count {
        0 => String::from("No more bottles of beer"),
        1 => String::from("1 bottle of beer"),
        _ => format!("{} bottles of beer", count),
    }
}

fn instruction(n: i32) -> &'static str {
    match n {
        0 => "Go to the store and buy some more",
        1 => "Take it down and pass it around",
        _ => "Take one down and pass it around",
    }
}
