/// Yields each item of a and then each item of b
pub fn append<T, I>(a: I, b: I) -> impl Iterator<Item=T>
where
    I: Iterator<Item=T>,
{
    struct AppendIterator<T, I: Iterator<Item=T>> {
        a: I,
        b: I,
    }

    impl<T, I: Iterator<Item=T>> Iterator for AppendIterator<T, I> {
        type Item = T;

        fn next(&mut self) -> Option<Self::Item> {
            self.a.next().or_else(|| self.b.next())
        }
    }

    AppendIterator { a, b }
}

/// Combines all items in all nested iterators inside into one flattened iterator
pub fn concat<T, N, I>(nested_iter: N) -> impl Iterator<Item=T>
where
    N: Iterator<Item=I>,
    I: Iterator<Item=T>,
{
    struct ConcatIterator<T, N, I>
    where
        N: Iterator<Item=I>,
        I: Iterator<Item=T>,
    {
        nested_iter: N,
        current_iter: Option<I>,
    }

    impl<T, N, I> Iterator for ConcatIterator<T, N, I>
    where
        N: Iterator<Item=I>,
        I: Iterator<Item=T>,
    {
        type Item = T;

        fn next(&mut self) -> Option<Self::Item> {
            if let Some(current_iter) = self.current_iter.as_mut() {
                if let Some(current) = current_iter.next() {
                    return Some(current);
                }
            }

            if let Some(next_iter) = self.nested_iter.next() {
                self.current_iter = Some(next_iter);
                self.next()
            } else {
                None
            }
        }
    }

    ConcatIterator { nested_iter, current_iter: None }
}

/// Returns an iterator of all items in iter for which `predicate(item)` is true
pub fn filter<T, I, F>(iter: I, predicate: F) -> impl Iterator<Item=T>
where
    I: Iterator<Item=T>,
    F: Fn(&T) -> bool,
{
    struct FilterIterator<T, I, F>
    where
        I: Iterator<Item=T>,
        F: Fn(&T) -> bool,
    {
        iter: I,
        predicate: F,
    }

    impl<T, I, F> Iterator for FilterIterator<T, I, F>
    where
        I: Iterator<Item=T>,
        F: Fn(&T) -> bool,
    {
        type Item = T;

        fn next(&mut self) -> Option<Self::Item> {
            self.iter.find(|element| (self.predicate)(element))
        }
    }

    FilterIterator { iter, predicate }
}

pub fn length<I: Iterator>(iter: I) -> usize {
    let mut total = 0;

    for _ in iter {
        total += 1
    }

    total
}

/// Returns an iterator of the results of applying `function(item)` on all iter items
pub fn map<T, I, F, U>(iter: I, function: F) -> impl Iterator<Item=U>
where
    I: Iterator<Item=T>,
    F: Fn(T) -> U,
{
    struct MapIterator<T, I, F, U>
    where
        I: Iterator<Item=T>,
        F: Fn(T) -> U,
    {
        iter: I,
        function: F,
    }

    impl<T, I, F, U> Iterator for MapIterator<T, I, F, U>
    where
        I: Iterator<Item=T>,
        F: Fn(T) -> U,
    {
        type Item = U;

        fn next(&mut self) -> Option<Self::Item> {
            let value = self.iter.next()?;
            Some((self.function)(value))
        }
    }

    MapIterator { iter, function }
}

pub fn foldl<I, F, U>(mut iter: I, initial: U, function: F) -> U
where
    I: Iterator,
    F: Fn(U, I::Item) -> U,
{
    let mut current = initial;

    for element in iter {
        current = (function)(current, element)
    }

    current
}

pub fn foldr<I, F, U>(mut iter: I, initial: U, function: F) -> U
where
    I: DoubleEndedIterator,
    F: Fn(U, I::Item) -> U,
{
    let mut current = initial;

    while let Some(element) = iter.next_back() {
        current = (function)(current, element)
    }

    current
}

/// Returns an iterator with all the original items, but in reverse order
pub fn reverse<I: DoubleEndedIterator>(iter: I) -> impl Iterator<Item=I::Item> {
    struct ReverseIterator<T, I>
    where
        I: DoubleEndedIterator<Item=T>,
    {
        iter: I,
    }

    impl<T, I> Iterator for ReverseIterator<T, I>
    where
        I: DoubleEndedIterator<Item=T>,
    {
        type Item = T;

        fn next(&mut self) -> Option<Self::Item> {
            self.iter.next_back()
        }
    }

    ReverseIterator { iter }
}
