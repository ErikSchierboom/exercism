export default class Triplet {
    private x: number
    private y: number
    private z: number

    constructor(x: number, y: number, z: number) {
        this.x = x
        this.y = y
        this.z = z
    }

    sum() {
        return this.x + this.y + this.z
    }

    product() {
        return this.x * this.y * this.z
    }

    isPythagorean() {
        return this.x * this.x + this.y * this.y === this.z * this.z
    }

    static where(maxFactor: number, minFactor?: number, sum?: number) {
        const triplets = []

        if (minFactor === undefined) {
            minFactor = 1
        }

        for (let i = minFactor; i < maxFactor - 1; i++) {
            for (let j = i + 1; j < maxFactor; j++) {
                for (let k = j + 1; k <= maxFactor; k++) {
                    const triplet = new Triplet(i, j, k)
                    if (triplet.isPythagorean() && (sum || triplet.sum()) === triplet.sum()) {
                        triplets.push(triplet)
                    }
                }
            }
        }

        return triplets
    }
}