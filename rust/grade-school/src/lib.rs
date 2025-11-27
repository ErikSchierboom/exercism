use itertools::Itertools;
use std::collections::HashMap;

pub struct School<'a> {
    students: HashMap<&'a str, u32>
}

impl<'a> School<'a> {
    pub fn new() -> School<'a> {
        School { students: HashMap::new() }
    }

    pub fn add(&mut self, grade: u32, student: &'a str) {
        self.students.entry(student).or_insert(grade);
    }

    pub fn grades(&self) -> Vec<u32> {
        self.students
            .values()
            .dedup()
            .sorted()
            .cloned()
            .collect()
    }

    pub fn grade(&self, grade: u32) -> Vec<String> {
        self.students
            .iter()
            .filter(|(_, student_grade)| **student_grade == grade)
            .map(|(student, _)| student.to_string())
            .sorted()
            .collect()
    }
}
