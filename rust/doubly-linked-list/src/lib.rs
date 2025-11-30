use std::ptr::NonNull;

mod pre_implemented;

pub type Link<T> = Option<NonNull<Node<T>>>;

#[derive(Debug)]
pub struct Node<T> {
    value: T,
    next: Link<T>,
    prev: Link<T>,
}

#[derive(Debug)]
pub struct LinkedList<T> {
    front: Link<T>,
    back: Link<T>,
    count: usize
}

#[derive(Debug)]
pub struct Cursor<'a, T> {
    list: &'a mut LinkedList<T>,
    current: Link<T>
}

pub struct Iter<'a, T> {
    current: Option<&'a Node<T>>
}

impl<T> LinkedList<T> {
    pub fn new() -> Self {
        Self { front: None, back: None, count: 0 }
    }

    pub fn is_empty(&self) -> bool {
        self.count == 0
    }

    pub fn len(&self) -> usize {
        self.count
    }

    pub fn cursor_front(&mut self) -> Cursor<'_, T> {
        let current = self.front;
        Cursor { list: self, current }
    }

    pub fn cursor_back(&mut self) -> Cursor<'_, T> {
        let current = self.back;
        Cursor { list: self, current }
    }

    pub fn iter(&self) -> Iter<'_, T> {
        let current= self.front.as_ref().map(|node| {
            unsafe { node.as_ref() }
        });
        Iter { current }
    }
}

impl<T> Cursor<'_, T> {
    pub fn peek_mut(&mut self) -> Option<&mut T> {
        self.current.map(|mut node| {
            unsafe { &mut node.as_mut().value }
        })
    }

    pub fn next(&mut self) -> Option<&mut T> {
        self.current.map(|node| {
            unsafe { self.current = node.as_ref().next }
        });
        self.peek_mut()
    }

    pub fn prev(&mut self) -> Option<&mut T> {
        self.current.map(|node| {
            unsafe { self.current = node.as_ref().prev }
        });
        self.peek_mut()
    }

    /// Remove and return the element at the current position and move the cursor
    /// to the neighboring element that's closest to the back. This can be
    /// either the next or previous position.
    pub fn take(&mut self) -> Option<T> {
        self.current.map(|node| {
            unsafe {
                let node_ptr = node.as_ptr();
                let next = (*node_ptr).next;
                let prev = (*node_ptr).prev;

                if let Some(mut n) = next {
                    n.as_mut().prev = prev;
                } else {
                    self.list.back = prev;
                }

                if let Some(mut p) = prev {
                    p.as_mut().next = next;
                } else {
                    self.list.front = next;
                }

                self.current = next.or(prev);

                self.list.count -= 1;

                let boxed = Box::from_raw(node_ptr);
                boxed.value
            }
        })
    }

    pub fn insert_after(&mut self, element: T) {
        unsafe {
            let prev = self.current;
            let next = self.current.and_then(|current| current.as_ref().next);
            self.insert_between(element, prev, next)
        }
    }

    pub fn insert_before(&mut self, element: T) {
        unsafe {
            let prev = self.current.and_then(|current| current.as_ref().prev);
            let next = self.current;
            self.insert_between(element, prev, next)
        }
    }

    pub fn insert_between(&mut self, element: T, prev: Link<T>, next: Link<T>) {
        unsafe {
            let node = Node { value: element, prev, next };
            let link = NonNull::new(Box::into_raw(Box::new(node)));

            if let Some(mut node) = prev {
                node.as_mut().next = link
            } else {
                self.list.front = link
            }

            if let Some(mut node) = next {
                node.as_mut().prev = link
            } else {
                self.list.back = link
            }
        }

        self.list.count += 1
    }
}

impl<'a, T> Iterator for Iter<'a, T> {
    type Item = &'a T;

    fn next(&mut self) -> Option<&'a T> {
        unsafe {
            self.current.map(|node| {
                self.current = node.next.map(|next| next.as_ref());
                &node.value
            })
        }
    }
}

impl<T> Drop for LinkedList<T> {
    fn drop(&mut self) {
        let mut cursor = self.cursor_front();
        while cursor.take().is_some() {}
    }
}
