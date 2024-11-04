use std::io::{Read, Result, Write};

pub struct ReadStats<R> {
    wrapped: R,
    reads: usize,
    bytes_through: usize
}

impl<R: Read> ReadStats<R> {
    pub fn new(wrapped: R) -> ReadStats<R> {
        Self { wrapped, reads: 0, bytes_through: 0 }
    }

    pub fn get_ref(&self) -> &R {
        &self.wrapped
    }

    pub fn bytes_through(&self) -> usize {
        self.bytes_through
    }

    pub fn reads(&self) -> usize {
        self.reads
    }
}

impl<R: Read> Read for ReadStats<R> {
    fn read(&mut self, buf: &mut [u8]) -> Result<usize> {
        self.wrapped.read(buf).inspect(|count| {
            self.reads += 1;
            self.bytes_through += count
        })
    }
}

pub struct WriteStats<W> {
    wrapped: W,
    writes: usize,
    bytes_through: usize
}

impl<W: Write> WriteStats<W> {
    pub fn new(wrapped: W) -> WriteStats<W> {
        Self { wrapped, writes: 0, bytes_through: 0 }
    }

    pub fn get_ref(&self) -> &W {
        &self.wrapped
    }

    pub fn bytes_through(&self) -> usize {
        self.bytes_through
    }

    pub fn writes(&self) -> usize {
        self.writes
    }
}

impl<W: Write> Write for WriteStats<W> {
    fn write(&mut self, buf: &[u8]) -> Result<usize> {
        self.wrapped.write(buf).inspect(|count| {
            self.writes += 1;
            self.bytes_through += count
        })
    }

    fn flush(&mut self) -> Result<()> {
        self.wrapped.flush()
    }
}
