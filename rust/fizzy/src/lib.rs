use std::fmt::Display;
use std::ops::Rem;

pub struct Matcher<T> {
    matcher: fn(T) -> bool,
    subs: String,
}

impl<T> Matcher<T> {
    pub fn new<S: ToString>(matcher: fn(T) -> bool, subs: S) -> Self {
        Self { matcher, subs: subs.to_string() }
    }
}

pub struct Fizzy<T> {
    matchers: Vec<Matcher<T>>,
}

impl<T: Clone + Display> Fizzy<T> {
    pub fn new() -> Self {
        Self { matchers: Vec::new() }
    }

    pub fn add_matcher(mut self, matcher: Matcher<T>) -> Self {
        self.matchers.push(matcher);
        self
    }

    pub fn apply<I>(self, iter: I) -> impl Iterator<Item=String>
    where
        I: Iterator<Item=T>,
    {
       iter.map(move |element| {
           let sound: String = self.matchers
               .iter()
               .filter_map(|matcher| {
                   if (matcher.matcher)(element.clone()) {
                       Some(matcher.subs.clone())
                   } else {
                       None
                   }
               })
               .collect();

           if sound.is_empty() {
               element.to_string()
           } else {
               sound
           }
       })
    }
}

pub fn fizz_buzz<T: Clone + Display + Rem<Output = T> + PartialEq + From<u8>>() -> Fizzy<T> {
    Fizzy::new()
        .add_matcher(Matcher::new(|i| i % 3.into() == 0.into(), "fizz"))
        .add_matcher(Matcher::new(|i| i % 5.into() == 0.into(), "buzz"))
}
