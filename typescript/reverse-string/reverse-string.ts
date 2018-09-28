export default class ReverseString {
    static reverse(input: string) {
        return [...input].reverse().join('')
    }
}