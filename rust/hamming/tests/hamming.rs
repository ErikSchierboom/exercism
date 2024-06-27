fn process_distance_case(strand_pair: [&str; 2], expected_distance: Option<usize>) {
    assert_eq!(
        hamming::hamming_distance(strand_pair[0], strand_pair[1]),
        expected_distance
    );
}

#[test]
fn empty_strands() {
    process_distance_case(["", ""], Some(0));
}

#[test]
/// disallow first strand longer
fn disallow_first_strand_longer() {
    process_distance_case(["AATG", "AAA"], None);
}

#[test]
/// disallow second strand longer
fn disallow_second_strand_longer() {
    process_distance_case(["ATA", "AGTG"], None);
}

#[test]
fn first_string_is_longer() {
    process_distance_case(["AAA", "AA"], None);
}

#[test]
fn second_string_is_longer() {
    process_distance_case(["A", "AA"], None);
}

#[test]
/// single letter identical strands
fn single_letter_identical_strands() {
    process_distance_case(["A", "A"], Some(0));
}

#[test]
/// small distance
fn single_letter_different_strands() {
    process_distance_case(["G", "T"], Some(1));
}

#[test]
/// long identical strands
fn long_identical_strands() {
    process_distance_case(["GGACTGAAATCTG", "GGACTGAAATCTG"], Some(0));
}

#[test]
fn no_difference_between_identical_strands() {
    process_distance_case(["GGACTGA", "GGACTGA"], Some(0));
}

#[test]
fn complete_hamming_distance_in_small_strand() {
    process_distance_case(["ACT", "GGA"], Some(3));
}

#[test]
fn small_hamming_distance_in_the_middle_somewhere() {
    process_distance_case(["GGACG", "GGTCG"], Some(1));
}

#[test]
fn larger_distance() {
    process_distance_case(["ACCAGGG", "ACTATGG"], Some(2));
}

#[test]
/// large distance in off-by-one strand
fn long_different_strands() {
    process_distance_case(["GGACGGATTCTG", "AGGACGGATTCT"], Some(9));
}
