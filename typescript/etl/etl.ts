export default function transform(input: {[key: string]: string[]}): {[key: string]: number} {
    const result: {[key: string]: number} = {}

    for (const key in input) {
        for (const char of input[key]) {
            result[char.toLowerCase()] = parseInt(key, 10)
        }
    }

    return result
}