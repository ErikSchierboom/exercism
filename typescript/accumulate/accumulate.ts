export default function accumulate<T, K>(input: T[], accumulator: (element: T) => K) {
    const acc = []

    for (const element of input) {
        acc.push(accumulator(element))
    }

    return acc
}