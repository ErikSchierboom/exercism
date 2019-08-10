use std::collections::HashMap;

pub fn brackets_are_balanced(string: &str) -> bool {
    let brackets: HashMap<_, _> = vec![(']', '['), ('}', '{'), (')', '(')]
        .into_iter()
        .collect();

    let mut unpaired_brackets: Vec<char> = Vec::new();

    for c in string.chars() {
        if brackets.values().any(|&open_bracket| c == open_bracket) {
            unpaired_brackets.push(c)
        } else if let Some(opening_bracket) = brackets.get(&c) {
            match unpaired_brackets.last() {
                Some(last_bracket) if last_bracket == opening_bracket => (),
                _ => return false,
            }

            unpaired_brackets.pop();
        }
    }

    unpaired_brackets.is_empty()
}
