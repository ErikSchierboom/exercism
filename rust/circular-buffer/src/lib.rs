use std::collections::VecDeque;

pub struct CircularBuffer<T> {
    elements: VecDeque<T>,
    capacity: usize
}

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

impl<T> CircularBuffer<T> {
    pub fn new(capacity: usize) -> Self {
        Self { elements: VecDeque::with_capacity(capacity), capacity }
    }

    pub fn write(&mut self, element: T) -> Result<(), Error> {
        if self.elements.len() == self.capacity {
            Err(Error::FullBuffer)
        } else {
            self.elements.push_back(element);
            Ok(())
        }
    }

    pub fn read(&mut self) -> Result<T, Error> {
        self.elements.pop_front().ok_or(Error::EmptyBuffer)
    }

    pub fn clear(&mut self) {
        self.elements.clear()
    }

    pub fn overwrite(&mut self, element: T) {
        if self.elements.len() == self.capacity {
            self.elements.pop_front();
        }

        self.elements.push_back(element);
    }
}
