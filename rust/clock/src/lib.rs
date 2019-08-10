use std::fmt;
use std::fmt::Display;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    const HOURS_PER_DAY: i32 = 24;
    const MINUTES_PER_HOUR: i32 = 60;

    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = hours * Self::MINUTES_PER_HOUR + minutes;
        let normalized_minutes =
            Self::modulo(total_minutes, Self::MINUTES_PER_HOUR * Self::HOURS_PER_DAY);

        Clock {
            hours: normalized_minutes / Self::MINUTES_PER_HOUR,
            minutes: normalized_minutes % Self::MINUTES_PER_HOUR,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(self.hours, self.minutes + minutes)
    }

    fn modulo(x: i32, y: i32) -> i32 {
        ((x % y) + y) % y
    }
}

impl Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
