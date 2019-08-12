use modulo::Mod;
use std::fmt;
use std::fmt::Display;

#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32,
}

const HOURS_PER_DAY: i32 = 24;
const MINUTES_PER_HOUR: i32 = 60;
const MINUTES_PER_DAY: i32 = MINUTES_PER_HOUR * HOURS_PER_DAY;

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            minutes: (hours * MINUTES_PER_HOUR + minutes).modulo(MINUTES_PER_DAY),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(0, self.minutes + minutes)
    }
}

impl Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let hours = self.minutes / MINUTES_PER_HOUR;
        let minutes = self.minutes % MINUTES_PER_HOUR;

        write!(f, "{:02}:{:02}", hours, minutes)
    }
}
