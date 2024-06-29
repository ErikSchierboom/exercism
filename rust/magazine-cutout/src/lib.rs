use itertools::Itertools;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut word_counts = magazine.iter().counts();

    for word in note {
        let entry = word_counts.entry(word).or_insert(0);
        if *entry == 0 {
            return false
        }

        *entry -= 1;
    }

    true
}
