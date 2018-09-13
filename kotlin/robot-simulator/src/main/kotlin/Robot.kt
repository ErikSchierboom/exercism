import Orientation.*

class Robot(var gridPosition: GridPosition, var orientation: Orientation) {
    fun turnRight() {
        orientation = when (orientation) {
            NORTH -> EAST
            EAST -> SOUTH
            SOUTH -> WEST
            WEST -> NORTH
        }
    }

    fun turnLeft() {
        orientation = when (orientation) {
            NORTH -> WEST
            EAST -> NORTH
            SOUTH -> EAST
            WEST -> SOUTH
        }
    }

    fun advance() {
        gridPosition = when (orientation) {
            NORTH -> gridPosition.copy(y = gridPosition.y + 1)
            EAST -> gridPosition.copy(x = gridPosition.x + 1)
            SOUTH -> gridPosition.copy(y = gridPosition.y - 1)
            WEST -> gridPosition.copy(x = gridPosition.x - 1)
        }
    }

    fun simulate(instructions: String) {
        fun simulateInstruction(instruction: Char) {
            when (instruction) {
                'L' -> turnLeft()
                'R' -> turnRight()
                'A' -> advance()
                else -> throw IllegalArgumentException("Unknown instruction")
            }
        }

        instructions.forEach(::simulateInstruction)
    }

    constructor(): this(GridPosition(0, 0), NORTH)
}