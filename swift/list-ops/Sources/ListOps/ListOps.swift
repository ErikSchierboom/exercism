
func foldLeft<TIn, TOut>(_ l: [TIn], accumulated acc: TOut, combine c: (TOut, TIn) -> TOut) -> TOut {
    var state = acc

    for item in l {
        state = c(state, item)
    }

    return state
} 

func foldRight<TIn, TOut>(_ l: [TIn], accumulated acc: TOut, combine c: (TIn, TOut) -> TOut) -> TOut {
    guard !l.isEmpty else { return acc }

    var state = acc

    for item in l.reversed() {
        state = c(item, state)
    }

    return state
} 

func append<T>(_ l: [T], _ r: [T]) -> [T] {
    var appended = l

    for item in r {
        appended.append(item)
    }

    return appended
} 

func concat<T>(_ lists: [T]...) -> [T] {
    var concatenated: [T] = []

    for list in lists {
        for item in list {
            concatenated.append(item)
        }
    }

    return concatenated
} 

func length<T>(_ l: [T]) -> Int {
    var length = 0;

    for _ in l {
        length += 1
    }

    return length
} 

func filter<T>(_ l: [T], f: (T) -> Bool) -> [T] {
    var mapped: [T] = [];

    for item in l {
        if f(item) {
            mapped.append(item)
        }
    }

    return mapped
} 

func map<TIn, TOut>(_ l: [TIn], f: (TIn) -> TOut) -> [TOut] {
    var mapped: [TOut] = [];

    for item in l {
        mapped.append(f(item))
    }

    return mapped
} 

func reverse<T>(_ l: [T]) -> [T] {
    var reversed: [T] = [];

    for item in l.reversed() {
        reversed.append(item)
    }

    return reversed
} 
