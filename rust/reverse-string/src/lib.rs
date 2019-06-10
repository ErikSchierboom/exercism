extern crate unicode_segmentation;

use std::iter::FromIterator;
use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    String::from_iter(input.graphemes(true).rev())
}
