import java.util.*

sealed class ForthOperation
data class ForthNumber(val number: Int) : ForthOperation()
data class ForthOperand(val operand: String) : ForthOperation()
data class ForthUserWord(val name: String, val operations: List<ForthOperation>) : ForthOperation()

object ForthParser {
    fun parseExpressions(instruction: String): List<ForthOperation> {
        val matches = Regex("""(: ([\w\d+\-*/]+) (.*?) ;)|(\d+)|([\w+\-*/]+)""").findAll(instruction)
        return matches.map(this::parseExpression).toList()
    }

    private fun parseExpression(matchResult: MatchResult): ForthOperation {
        val (_, name, operations, number, operand) = matchResult.destructured

        return when {
            name.isNotEmpty() && name.all(Character::isDigit) -> throw IllegalArgumentException("Cannot redefine numbers")
            name.isNotEmpty() -> ForthUserWord(name, parseExpressions(operations))
            number.isNotEmpty() -> ForthNumber(number.toInt())
            operand.isNotEmpty() -> ForthOperand(operand)
            else -> throw IllegalArgumentException("Unsupported expresssion")
        }
    }
}

class ForthEvaluator {
    val stack = ArrayDeque<Int>()
    val userOperations = mutableMapOf<String, List<ForthOperation>>()
    val builtInOperations = createBuiltInOperations()

    fun evaluateProgram(instructions: List<String>): List<Int> {
        instructions.flatMap(ForthParser::parseExpressions).forEach(this::evaluate)

        return stack.reversed().toList()
    }

    private fun evaluate(operation: ForthOperation): Unit = when(operation) {
        is ForthNumber -> stack.push(operation.number)
        is ForthUserWord -> userOperations[operation.name.uppercase()] = operation.operations
        is ForthOperand -> when {
            userOperations.containsKey(operation.operand.uppercase()) -> userOperations.getValue(operation.operand.uppercase()).forEach(this::evaluate)
            builtInOperations.containsKey(operation.operand.uppercase()) -> builtInOperations.getValue(operation.operand.uppercase()).invoke(stack)
            else -> throw IllegalArgumentException("No operations available for operator \"${operation.operand}\"")
        }
    }

    private fun createBuiltInOperations(): Map<String, (Deque<Int>) -> Unit> = listOf(
            createOperation("+") {
                require(it.size > 1) { "Addition requires that the stack contain at least 2 values" }
                val right = stack.pop()
                val left = stack.pop()
                stack.push(left + right)
            },
            createOperation("-") {
                require(it.size > 1) { "Subtraction requires that the stack contain at least 2 values" }
                val right = stack.pop()
                val left = stack.pop()
                stack.push(left - right)
            },
            createOperation("*") {
                require(it.size > 1) { "Multiplication requires that the stack contain at least 2 values" }
                val right = stack.pop()
                val left = stack.pop()
                stack.push(left * right)
            },
            createOperation("/") {
                require(it.size > 1) { "Division requires that the stack contain at least 2 values" }
                val right = stack.pop()
                val left = stack.pop()

                require(right > 0) { "Division by 0 is not allowed" }
                stack.push(left / right)
            },
            createOperation("DUP") {
                require(it.size > 0) { "Duplicating requires that the stack contain at least 1 value" }
                stack.push(stack.peek())
            },
            createOperation("DROP") {
                require(it.size > 0) { "Dropping requires that the stack contain at least 1 value" }
                stack.pop()
            },
            createOperation("SWAP") {
                require(it.size > 1) { "Swapping requires that the stack contain at least 2 values" }
                val right = stack.pop()
                val left = stack.pop()
                stack.push(right)
                stack.push(left)
            },
            createOperation("OVER") {
                require(it.size > 1) { "Overing requires that the stack contain at least 2 values" }
                val right = stack.pop()
                val left = stack.pop()
                stack.push(left)
                stack.push(right)
                stack.push(left)
            }
    ).toMap()

    private fun createOperation(name: String, operation: (Deque<Int>) -> Unit): Pair<String, (Deque<Int>) -> Unit> =
            name to operation
}