export enum TriangleKind {
    Equilateral = "equilateral",
    Isosceles = "isosceles",
    Scalene = "scalene"
}

export default class Triangle {
    private x: number
    private y: number
    private z: number

    constructor(...sides: number[]) {
        [this.x, this.y, this.z] = sides.sort()
    }

    kind() {
        if (this.isInvalid()) {
            throw new Error('Invalid triangle')
        }

        if (this.isEquilateral()) {
            return TriangleKind.Equilateral
        }
        else if (this.isIsosceles()) {
            return TriangleKind.Isosceles
        }
        else {
            return TriangleKind.Scalene
        }
    }

    isInvalid() {
        return this.hasZeroSides() || this.hasNegativeSide() || this.violatesTriangleEquality()
    }

    private hasZeroSides() {
        return this.x === 0 && this.y === 0 && this.z === 0
    }

    private hasNegativeSide() {
        return this.x < 0 || this.y < 0 || this.z < 0
    }

    private violatesTriangleEquality() {
        return this.x + this.y <= this.z || this.x + this.z <= this.y || this.y + this.z <= this.x
    }

    private isEquilateral() {
        return this.x === this.y && this.y === this.z
    }

    private isIsosceles() {
        return this.x === this.y || this.y === this.z || this.x === this.z
    }
}