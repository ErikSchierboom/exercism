pub fn chain(input: &[(u8, u8)]) -> Option<Vec<(u8, u8)>> {
    if input.is_empty() {
        return Some(vec![])
    }

    let (head, tail) = input.split_at(1);
    form_chain(head.to_vec(), tail.to_vec())
}

fn form_chain(chain: Vec<(u8, u8)>, unused: Vec<(u8, u8)>) -> Option<Vec<(u8, u8)>> {
    if unused.is_empty() {
        return if can_chain(chain.last().unwrap(), chain.first().unwrap()) { Some(chain) } else { None };
    }

    (0..unused.len())
        .find_map(|i| {
            let mut remaining = unused.clone();
            let unchanged = remaining.remove(i);
            let flipped = (unchanged.1, unchanged.0);

            [unchanged, flipped]
                .iter()
                .find_map(|domino| {
                    if can_chain(chain.last().unwrap(), domino) {
                        let mut new_chain = chain.clone();
                        new_chain.push(*domino);
                        form_chain(new_chain, remaining.clone())
                    } else {
                        None
                    }
                })
        })
}

fn can_chain(left: &(u8, u8), right: &(u8, u8)) -> bool {
    left.1 == right.0
}

