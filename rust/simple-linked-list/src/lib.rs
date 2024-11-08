struct SimpleLinkedListNode<T> {
    element: T,
    next: Option<Box<SimpleLinkedListNode<T>>>,
}

impl<T> SimpleLinkedListNode<T> {
    pub fn new(element: T, next: Option<Box<SimpleLinkedListNode<T>>>) -> Self {
        Self { element, next }
    }
}

pub struct SimpleLinkedList<T> {
    head: Option<Box<SimpleLinkedListNode<T>>>,
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        Self { head: None }
    }

    pub fn is_empty(&self) -> bool {
        self.head.is_none()
    }

    pub fn len(&self) -> usize {
        let mut current = &self.head;
        let mut length = 0;

        while let Some(node) = current {
            length += 1;
            current = &node.next;
        }

        length
    }

    pub fn push(&mut self, element: T) {
        let node = SimpleLinkedListNode::new(element, self.head.take());
        self.head = Some(Box::from(node))
    }

    pub fn pop(&mut self) -> Option<T> {
        let head = self.head.take();
        match head {
            None => None,
            Some(node) => {
                self.head = node.next;
                Some(node.element)
            }
        }
    }

    pub fn peek(&self) -> Option<&T> {
        self.head.as_ref().map(|node| &node.element)
    }

    #[must_use]
    pub fn rev(self) -> SimpleLinkedList<T> {
        let mut reversed = Self::new();
        let mut current = self.head;

        while let Some(node) = current {
            reversed.push(node.element);
            current = node.next;
        }

        reversed
    }
}

impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item=T>>(iter: I) -> Self {
        let mut list = Self::new();

        for element in iter {
            list.push(element)
        }

        list
    }
}

impl<T> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut reversed = Vec::new();
        let mut current = linked_list.head;

        while let Some(node) = current {
            reversed.push(node.element);
            current = node.next;
        }

        reversed.reverse();
        reversed
    }
}
