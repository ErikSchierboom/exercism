#[derive(Debug)]
pub struct Item {
    pub weight: u32,
    pub value: u32,
}

pub fn maximum_value(max_weight: u32, items: &[Item]) -> u32 {

    let mut max_weights = vec![vec![0; max_weight as usize + 1]; items.len() + 1];

    for item_idx in 1..=items.len() {
        for capacity in 1..=max_weight {
            let max_with_current = if capacity >= items[item_idx - 1].weight {
                max_weights[item_idx - 1][(capacity - items[item_idx - 1].weight) as usize] + items[item_idx - 1].value
            } else {
                0
            };

            max_weights[item_idx][capacity as usize] = max_with_current.max(max_weights[item_idx - 1][capacity as usize]);
        }
    }

    max_weights[items.len()][max_weight as usize]
}
