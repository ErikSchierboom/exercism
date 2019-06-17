use nth_prime as np;

#[test]
fn test_first_prime() {
    assert_eq!(np::nth(0), 2);
}

#[test]
fn test_second_prime() {
    assert_eq!(np::nth(1), 3);
}

#[test]
fn test_third_prime() {
    assert_eq!(np::nth(2), 5);
}

#[test]
fn test_fourth_prime() {
    assert_eq!(np::nth(3), 7);
}

#[test]
fn test_fifth_prime() {
    assert_eq!(np::nth(4), 11);
}

#[test]
fn test_sixth_prime() {
    assert_eq!(np::nth(5), 13);
}

#[test]
fn test_big_prime() {
    assert_eq!(np::nth(10000), 104743);
}
