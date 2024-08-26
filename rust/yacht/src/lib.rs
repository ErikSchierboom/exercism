use std::collections::HashMap;
use itertools::Itertools;

#[derive(Debug)]
pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];

pub fn score(dice: Dice, category: Category) -> u8 {
    let counts = dice.iter().counts();

    match category {
        Category::Ones => singles(counts, 1),
        Category::Twos => singles(counts, 2),
        Category::Threes => singles(counts, 3),
        Category::Fours => singles(counts, 4),
        Category::Fives => singles(counts, 5),
        Category::Sixes => singles(counts, 6),
        Category::FullHouse => full_house(counts, dice),
        Category::FourOfAKind => four_of_a_kind(counts, dice),
        Category::LittleStraight => little_straight(counts),
        Category::BigStraight => big_straight(counts),
        Category::Choice => choice(dice),
        Category::Yacht => yacht(counts),
    }
}

fn singles(counts: HashMap<&u8, usize>, die: u8) -> u8 {
    *counts.get(&die).unwrap_or(&0) as u8 * die
}

fn yacht(counts: HashMap<&u8, usize>) -> u8 {
    if counts.len() == 1 { 50 } else { 0 }
}

fn choice(dice: Dice) -> u8 {
    dice.iter().sum()
}

fn big_straight(counts: HashMap<&u8, usize>) -> u8 {
    if counts.len() == 5 && !counts.contains_key(&1) { 30 } else { 0 }
}

fn little_straight(counts: HashMap<&u8, usize>) -> u8 {
    if counts.len() == 5 && !counts.contains_key(&6) { 30 } else { 0 }
}

fn full_house(counts: HashMap<&u8, usize>, dice: Dice) -> u8 {
    if counts.len() == 2 && counts.values().any(|v| *v == 2) { dice.iter().sum() } else { 0 }
}

fn four_of_a_kind(counts: HashMap<&u8, usize>, dice: Dice) -> u8 {
    if counts.values().any(|v| *v >= 4) { dice.iter().sorted().as_slice()[1] * 4 } else { 0 }
}
