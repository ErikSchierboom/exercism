final class Robot {
    private GridPosition gridPosition;
    private Orientation orientation;

    public Robot(GridPosition gridPosition, Orientation orientation) {
        this.gridPosition = gridPosition;
        this.orientation = orientation;
    }

    public void turnRight() {
        switch (orientation) {
            case NORTH:
                orientation = Orientation.EAST;
                break;
            case EAST:
                orientation = Orientation.SOUTH;
                break;
            case SOUTH:
                orientation = Orientation.WEST;
                break;
            case WEST:
                orientation = Orientation.NORTH;
                break;
        }
    }

    public void turnLeft() {
        switch (orientation) {
            case NORTH:
                orientation = Orientation.WEST;
                break;
            case EAST:
                orientation = Orientation.NORTH;
                break;
            case SOUTH:
                orientation = Orientation.EAST;
                break;
            case WEST:
                orientation = Orientation.SOUTH;
                break;
        }
    }

    public void advance() {
        switch (orientation) {
            case NORTH:
                this.gridPosition = new GridPosition(this.gridPosition.x, this.gridPosition.y + 1);
                break;
            case EAST:
                this.gridPosition = new GridPosition(this.gridPosition.x + 1, this.gridPosition.y);
                break;
            case SOUTH:
                this.gridPosition = new GridPosition(this.gridPosition.x, this.gridPosition.y - 1);
                break;
            case WEST:
                this.gridPosition = new GridPosition(this.gridPosition.x - 1, this.gridPosition.y);
                break;
        }
    }

    public void simulate(String instructions) {
        for (int i = 0; i < instructions.length(); i++) {
            applyInstruction(instructions.charAt(i));
        }
    }

    public void applyInstruction(char instruction) {
        switch (instruction) {
            case 'L':
                turnLeft();
                break;
            case 'R':
                turnRight();
                break;
            case 'A':
                advance();
                break;
            default:
                throw new IllegalArgumentException("Invalid instruction");
        }
    }

    public GridPosition getGridPosition() {
        return gridPosition;
    }

    public Orientation getOrientation() {
        return orientation;
    }
}