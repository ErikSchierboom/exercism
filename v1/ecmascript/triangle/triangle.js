export default class Triangle {
    constructor(x, y, z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    kind() {
        if (this.isInvalid())
            throw new Error('Invalid triangle');

        if (this.isEquilateral())
            return 'equilateral';
        if (this.isIsosceles())
            return 'isosceles';

        return 'scalene'
    }

    hasZeroSides() {
        return this.x === 0 && this.y === 0 && this.z === 0;
    }

    hasNegativeSide() {
        return this.x < 0 || this.y < 0 || this.z < 0;
    }

    violatesTriangleEquality() { 
        return this.x + this.y <= this.z || this.x + this.z <= this.y || this.y + this.z <= this.x;
    }

    isInvalid() {
        return this.hasZeroSides() || this.hasNegativeSide() || this.violatesTriangleEquality();
    }

    isEquilateral() {
        return this.x === this.y && this.y === this.z;
    }
    
    isIsosceles() {
        return this.x === this.y || this.y === this.z || this.x === this.z;
    }
}