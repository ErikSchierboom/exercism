export default class Robot {
  public bearing: string;
  public coordinates: [number, number];

  constructor(x: number = 0, y: number = 0, direction: string = "north") {
    this.bearing = direction;
    this.coordinates = [x, y];
  }

  public orient(bearing: string) {
    this.bearing = bearing;
  }

  public at(x: number, y: number) {
    this.coordinates = [x, y];
  }

  public turnRight() {
    switch (this.bearing) {
      case "north":
        this.bearing = "east";
        break;
      case "east":
        this.bearing = "south";
        break;
      case "south":
        this.bearing = "west";
        break;
      case "west":
        this.bearing = "north";
        break;
    }
  }

  public turnLeft() {
    switch (this.bearing) {
      case "north":
        this.bearing = "west";
        break;
      case "east":
        this.bearing = "north";
        break;
      case "south":
        this.bearing = "east";
        break;
      case "west":
        this.bearing = "south";
        break;
    }
  }

  public advance() {
    const [x, y] = this.coordinates;

    switch (this.bearing) {
      case "north":
        this.coordinates = [x, y + 1];
        break;
      case "east":
        this.coordinates = [x + 1, y];
        break;
      case "south":
        this.coordinates = [x, y - 1];
        break;
      case "west":
        this.coordinates = [x - 1, y];
        break;
    }
  }

  public instructions(input: string) {
    return [...input].map(instruction => this.getInstruction(instruction));
  }

  private getInstruction(instruction: string) {
    switch (instruction) {
      case "L":
        return "turnLeft";
      case "R":
        return "turnRight";
      case "A":
        return "advance";
      default:
        throw new Error("Invalid instruction");
    }
  }

  public evaluate(instructions: string) {
    [...instructions].map(instruction => this.evaluateInstruction(instruction));
  }

  private evaluateInstruction(instruction: string) {
    switch (instruction) {
      case "L":
        this.turnLeft();
        break;
      case "R":
        this.turnRight();
        break;
      case "A":
        this.advance();
        break;
      default:
        throw new Error("Invalid instruction");
    }
  }
}
