export default class Triplet {
    constructor(x, y, z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    sum() {
        return this.x + this.y + this.z;
    }

    product() {
        return this.x * this.y * this.z;
    }

    isPythagorean() {
        return this.x * this.x + this.y * this.y === this.z * this.z;
    }

    static where({ minFactor: minFactor = 1, maxFactor: maxFactor = undefined, sum: sum = undefined }) {
        const triplets = [];

        for (let i = minFactor; i < maxFactor - 1; i++) {
            for (let j = i + 1; j < maxFactor; j++) {
                for (let k = j + 1; k <= maxFactor; k++) {
                    const triplet = new Triplet(i, j, k);
                    if (triplet.isPythagorean() && (sum || triplet.sum()) === triplet.sum())
                        triplets.push(triplet);
                }
            }
        }

        return triplets;
    }
}