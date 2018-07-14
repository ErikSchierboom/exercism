export default function SumOfMultiples(multiples) {
    return {
        to: function(max) {
            let sum = 0;

            for (let i = 1; i < max; i++) {
                if (multiples.find(m => i % m === 0))
                    sum += i;
            }

            return sum;
        }
    }
}