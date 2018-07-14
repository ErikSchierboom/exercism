function isPalindrome(num) {
    let n = num;
    let rev = 0;
    while (num > 0) {
        const dig = num % 10;
        rev = rev * 10 + dig;
        num = Math.floor(num / 10);
    }

    return n === rev;
}

export default function generate({ minFactor = 1, maxFactor = Number.MAX_VALUE }) {
    let largest  = { value: Number.MIN_VALUE, factors: [] }
    let smallest = { value: Number.MAX_VALUE, factors: [] }

    for (let x = minFactor; x <= maxFactor; x++) {
        for (let y = x; y <= maxFactor; y++) {
            const product = x * y;

            if (isPalindrome(product)) {
                if (product >= largest.value) {
                    largest.value = product;
                    largest.factors = [x, y];
                }

                if (product <= smallest.value) {
                    smallest.value = product;
                    smallest.factors = [x, y];
                }
            } 
        }        
    }

    return { largest, smallest }
}