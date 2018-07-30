class Robot(var gridPosition: GridPosition, var orientation: Orientation) {
    fun turnRight() {
        orientation = when (orientation) {
            Orientation.NORTH -> Orientation.EAST
            Orientation.EAST -> Orientation.SOUTH
            Orientation.SOUTH -> Orientation.WEST
            Orientation.WEST -> Orientation.NORTH
        }
    }

    fun turnLeft() {
        orientation = when (orientation) {
            Orientation.NORTH -> Orientation.WEST
            Orientation.EAST -> Orientation.NORTH
            Orientation.SOUTH -> Orientation.EAST
            Orientation.WEST -> Orientation.SOUTH
        }
    }

    fun advance() {
        gridPosition = when (orientation) {
            Orientation.NORTH -> gridPosition.copy(y = gridPosition.y + 1)
            Orientation.EAST -> gridPosition.copy(x = gridPosition.x + 1)
            Orientation.SOUTH -> gridPosition.copy(y = gridPosition.y - 1)
            Orientation.WEST -> gridPosition.copy(x = gridPosition.x - 1)
        }
    }

    fun simulate(instructions: String) {
        fun simulateInstruction(instruction: Char) {
            require(instruction in "LRA")

            when (instruction) {
                'L' -> turnLeft()
                'R' -> turnRight()
                'A' -> advance()
            }
        }

        instructions.forEach(::simulateInstruction)
    }

    constructor(): this(GridPosition(0, 0), Orientation.NORTH)
}