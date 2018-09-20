export function keep<T>(input: T[], predicate: (element: T) => boolean) {
    const matches = []

    for (const element of input) {
        if (predicate(element)) {
            matches.push(element)
        }
    }

    return matches
}

export function discard<T>(input: T[], predicate: (element: T) => boolean) {
    return keep(input, (element) => !predicate(element))
}