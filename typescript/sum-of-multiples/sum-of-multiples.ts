export default function SumOfMultiples(multiples: number[]) {
    return {
        to(max: number) {
            let sum = 0

            for (let i = 1; i < max; i += 1) {
                if (multiples.find((m) => i % m === 0)) {
                    sum += i
                }
            }

            return sum
        }
    }
}