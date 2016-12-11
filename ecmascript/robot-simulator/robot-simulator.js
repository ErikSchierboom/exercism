const Direction = {
    north: 'north',
    east: 'east',
    south: 'south',
    west: 'west'
}

export default class Robot {
    constructor() {
        this.direction = Direction.north;
        this.coords = [0, 0];
    }

    orient(direction) {
        this.bearing = direction;
    }

    at(x, y) {
        this.coordinates = [x, y];
    }

    place({ x: x, y: y, direction: direction }) {
        this.at(x, y);
        this.orient(direction);
    }

    turnRight() {
        switch (this.bearing) {
            case Direction.north:
                this.bearing = Direction.east;
                break;
            case Direction.east:
                this.bearing = Direction.south;
                break;
            case Direction.south:
                this.bearing = Direction.west;
                break;
            case Direction.west:
                this.bearing = Direction.north;
                break;
        }
    }

    turnLeft() {
        switch (this.bearing) {
            case Direction.north:
                this.bearing = Direction.west;
                break;
            case Direction.east:
                this.bearing = Direction.north;
                break;
            case Direction.south:
                this.bearing = Direction.east;
                break;
            case Direction.west:
                this.bearing = Direction.south;
                break;
        }
    }

    advance() {
        const [x, y] = this.coordinates;

        switch (this.bearing) {
            case Direction.north:
                this.coordinates = [x, y + 1];
                break;
            case Direction.east:
                this.coordinates = [x + 1, y];
                break;
            case Direction.south:
                this.coordinates = [x, y - 1];
                break;
            case Direction.west:
                this.coordinates = [x - 1, y];
                break;
        }
    }

    instructions(input) {
        return [...input].map(instruction => this.getInstruction(instruction));
    }

    getInstruction(instruction) {
        switch (instruction) {
            case 'L':
                return 'turnLeft';
            case 'R':
                return 'turnRight';
            case 'A':
                return 'advance';
            default:
                throw new Error('Invalid instruction');
        }
    }

    evaluate(instructions) {
        [...instructions].map(instruction => this.evaluateInstruction(instruction));
    }

    evaluateInstruction(instruction) {
        switch (instruction) {
            case 'L':
                this.turnLeft();
                break;
            case 'R':
                this.turnRight();
                break;
            case 'A':
                this.advance();
                break;
            default:
                throw new Error('Invalid instruction');
        }
    }

    get bearing() {
        return this.direction;
    }

    set bearing(value) {
        this.direction = value;
    }

    get coordinates() {
        return this.coords;
    }

    set coordinates(value) {
        this.coords = value;
    }
}