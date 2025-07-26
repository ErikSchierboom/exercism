use rand::seq::SliceRandom;
use rand::rng;
use std::sync::{LazyLock, Mutex};

pub struct Robot {
    name: String
}

static NAMES: LazyLock<Mutex<Vec<String>>> = LazyLock::new(|| {
    let mut names: Vec<String> = Vec::with_capacity(676_000);
    for i in 0..=999 {
        for a in 'A'..='Z' {
            for b in 'A'..='Z' {
                names.push(format!("{a}{b}{i:03}"))
            }
        }
    }

    names.shuffle(&mut rng());
    Mutex::new(names)
});


impl Robot {
    pub fn new() -> Self {
        Self { name: Self::random_name() }
    }

    pub fn name(&self) -> &str {
        self.name.as_str()
    }

    pub fn reset_name(&mut self) {
        self.name = Self::random_name()
    }

    fn random_name() -> String {
        NAMES.lock().unwrap().pop().unwrap()
    }
}
