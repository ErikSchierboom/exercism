export default class Raindrops {
    convert(i: number) {
        const parts = []

        if (i % 3 === 0) {
            parts.push('Pling')
        }

        if (i % 5 === 0) {
            parts.push('Plang')
        }

        if (i % 7 === 0) {
            parts.push('Plong')
        }

        return parts.length === 0 ? i.toString() : parts.join('')
    }
}