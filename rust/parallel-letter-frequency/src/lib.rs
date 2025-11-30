use std::collections::HashMap;
use std::thread;

pub fn frequency(texts: &[&str], worker_count: usize) -> HashMap<char, usize> {
    if texts.is_empty() {
        return HashMap::new();
    }

    texts
        .chunks((texts.len() / worker_count).max(texts.len()))
        .map(|chunk| {
            let chunk_texts: Vec<String> = chunk.iter().map(|s| s.to_string()).collect();

            thread::spawn(move || {
                chunk_texts
                    .iter()
                    .fold(HashMap::new(), |mut acc, text| {
                        for (c, count) in text_frequency(text) {
                            *acc.entry(c).or_insert(0) += count
                        }
                        acc
                    })
            })
        })
        .map(|handle| handle.join().unwrap())
        .fold(HashMap::new(), |mut acc, frequencies| {
            for (c, count) in frequencies {
                *acc.entry(c).or_insert(0) += count
            }

            acc
        })
}

fn text_frequency(text: &str) -> HashMap<char, usize> {
    text.to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .fold(HashMap::new(), |mut acc, c| {
            *acc.entry(c).or_insert(0) += 1;
            acc
        })
}
