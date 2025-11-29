use std::borrow::Borrow;

#[derive(Clone)]
pub struct Xorcism<'a> {
    key: &'a [u8],
    offset: usize
}

impl<'a> Xorcism<'a> {
    pub fn new<Key: AsRef<[u8]> + ?Sized>(key: &'a Key) -> Xorcism<'a> {
        Self { key: key.as_ref(), offset: 0 }
    }

    pub fn munge_in_place(&mut self, data: &mut [u8]) {
        for element in data {
            *element = *element ^ self.key[self.offset];
            self.offset = (self.offset + 1) % self.key.len()
        }
    }

    pub fn munge<Data: IntoIterator<Item = impl Borrow<u8>>>(&mut self, data: Data) -> impl Iterator<Item = u8> {
        data
            .into_iter()
            .map(|element| {
                let xored = element.borrow() ^ self.key[self.offset];
                self.offset = (self.offset + 1) % self.key.len();
                xored
            })
    }
}
