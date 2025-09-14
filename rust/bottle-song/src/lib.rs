const NUMBERS: [&str; 11] = ["no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];
const CAPITALIZED_NUMBERS: [&str; 11] = ["No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"];

pub fn verse(start_bottles: u32) -> String {
    format!("{0} green bottle{1} hanging on the wall,\n\
             {0} green bottle{1} hanging on the wall,\n\
             And if one green bottle should accidentally fall,\n\
             There'll be {2} green bottle{3} hanging on the wall.",
            CAPITALIZED_NUMBERS[start_bottles as usize],
            if start_bottles == 1 { "" } else { "s" },
            NUMBERS[(start_bottles - 1) as usize],
            if start_bottles - 1 == 1 { "" } else { "s" })
}

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    (0..take_down)
        .map(|taken_down| verse(start_bottles - taken_down))
        .reduce(|l, r| format!("{l}\n\n{r}"))
        .unwrap()
}
