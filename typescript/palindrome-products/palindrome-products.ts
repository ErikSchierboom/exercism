type Result = { value: number, factors: number[] }

function isPalindrome(num: number) {
    let n = num
    let rev = 0
    while (n > 0) {
        const dig = n % 10
        rev = rev * 10 + dig
        n = Math.floor(n / 10)
    }

    return num === rev
}

export default function generate({ minFactor = 1, maxFactor = Number.MAX_VALUE }) {
    const largest: Result  = { value: Number.MIN_VALUE, factors: [] }
    const smallest: Result = { value: Number.MAX_VALUE, factors: [] }

    for (let x = minFactor; x <= maxFactor; x++) {
        for (let y = x; y <= maxFactor; y++) {
            const product = x * y

            if (isPalindrome(product)) {
                if (product >= largest.value) {
                    largest.value = product
                    largest.factors = [x, y]
                }

                if (product <= smallest.value) {
                    smallest.value = product
                    smallest.factors = [x, y]
                }
            }
        }
    }

    return { largest, smallest }
}