export default function transform(input) {
    let result = {};

    for (const key in input) {
        for (const char of input[key]) {
            result[char.toLowerCase()] = parseInt(key);
        }
    }

    return result;
}