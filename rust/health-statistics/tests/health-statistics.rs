use health_statistics::*;

const NAME: &str = "Ebenezer";
const AGE: u32 = 89;
const WEIGHT: f32 = 131.6;

#[test]
fn name() {
    let user = User::new(NAME.into(), AGE, WEIGHT);
    assert_eq!(user.name(), NAME);
}

#[test]
fn age() {
    let user = User::new(NAME.into(), AGE, WEIGHT);
    assert_eq!(user.age(), AGE);
}

#[test]
fn weight() {
    let user = User::new(NAME.into(), AGE, WEIGHT);
    assert!((user.weight() - WEIGHT).abs() < f32::EPSILON);
}

#[test]
fn set_age() {
    let new_age: u32 = 90;
    let mut user = User::new(NAME.into(), AGE, WEIGHT);
    user.set_age(new_age);
    assert_eq!(user.age(), new_age);
}

#[test]
fn set_weight() {
    let new_weight: f32 = 129.4;
    let mut user = User::new(NAME.into(), AGE, WEIGHT);
    user.set_weight(new_weight);
    assert!((user.weight() - new_weight).abs() < f32::EPSILON);
}
