export default function accumulate(input, accumulator) {
    return input.map(i => accumulator(i));
}