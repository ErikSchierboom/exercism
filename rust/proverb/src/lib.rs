pub fn build_proverb(list: &[&str]) -> String {
    list
        .windows(2)
        .map(|pair| format!("For want of a {} the {} was lost.", pair[0], pair[1]))
        .chain(list.first().map(|first| format!("And all for the want of a {}.", first)))
        .collect::<Vec<_>>()
        .join("\n")
}
