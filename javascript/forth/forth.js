class ForthNumber {
  constructor(value) {
    this.value = value;
  }
}

class ForthOperand {
  constructor(operand) {
    this.operand = operand;
  }
}
class ForthUserWord {
  constructor(name, operations) {
    this.name = name;
    this.operations = operations;
  }
}

export default class Forth {
  constructor() {
    this.stack = [];
    this.userOperations = new Map();
    this.builtInOperation = this.createBuiltInOperations();
  }

  evaluate(instructions) {
    this.evaluateInstructions(this.parse(instructions));
  }

  evaluateInstructions(instructions) {
    instructions.forEach(this.evaluateInstruction.bind(this));
  }

  evaluateInstruction(instruction) {
    if (instruction instanceof ForthNumber) {
      this.evaluateNumberInstruction(instruction);
    } else if (instruction instanceof ForthOperand) {
      this.evaluateOperandInstruction(instruction);
    } else if (instruction instanceof ForthUserWord) {
      this.evaluateUserWordInstruction(instruction);
    }
  }

  evaluateNumberInstruction(instruction) {
    this.stack.push(instruction.value);
  }

  evaluateOperandInstruction(instruction) {
    if (this.userOperations.has(instruction.operand.toLowerCase())) {
      this.evaluateInstructions(
        this.userOperations.get(instruction.operand.toLowerCase())
      );
    } else if (this.builtInOperation.has(instruction.operand.toLowerCase())) {
      this.builtInOperation.get(instruction.operand.toLowerCase())(this.stack);
    } else {
      throw new Error("Unknown command");
    }
  }

  evaluateUserWordInstruction(instruction) {
    this.userOperations.set(
      instruction.name.toLowerCase(),
      instruction.operations
    );
  }

  parse(instructions) {
    const instructionsRegex = /(: ([\w\d+\-*/]+) (.*?) ;)|(\-?\d+)|([\w+\-*/]+)/g;

    let matches = [];
    let match = null;
    while ((match = instructionsRegex.exec(instructions)) !== null) {
      if (match[2] !== undefined) {
        if (isNumber(match[2])) {
          throw new Error("Invalid definition");
        }

        matches.push(
          new ForthUserWord(match[2].toLowerCase(), this.parse(match[3]))
        );
      } else if (match[4] !== undefined) {
        matches.push(new ForthNumber(parseInt(match[4], 10)));
      } else if (match[5] !== undefined) {
        matches.push(new ForthOperand(match[5]));
      }
    }

    return matches;
  }

  createBuiltInOperations() {
    return new Map([
      this.createBinaryOperationOnNumbers("+", (left, right) => left + right),
      this.createBinaryOperationOnNumbers("-", (left, right) => left - right),
      this.createBinaryOperationOnNumbers("*", (left, right) => left * right),
      this.createBinaryOperationOnNumbers("/", (left, right) => {
        if (right === 0) {
          throw new Error("Division by zero");
        }
        return Math.floor(left / right);
      }),
      this.createUnaryOperation("dup", stack =>
        stack.push(stack[stack.length - 1])
      ),
      this.createUnaryOperation("drop", stack => stack.pop()),
      this.createBinaryOperation("swap", stack =>
        stack.push(stack.pop(), stack.pop())
      ),
      this.createBinaryOperation("over", stack =>
        stack.push(stack[stack.length - 2])
      )
    ]);
  }

  createBinaryOperationOnNumbers(operand, operation) {
    return this.createBinaryOperation(operand, stack => {
      const right = stack.pop();
      const left = stack.pop();
      stack.push(operation(left, right));
    });
  }

  createBinaryOperation(operand, operation) {
    return this.createOperation(operand, operation, 2);
  }

  createUnaryOperation(operand, operation) {
    return this.createOperation(operand, operation, 1);
  }

  createOperation(operand, operation, minStackSize) {
    return [
      operand,
      stack => {
        if (stack.length < minStackSize) {
          throw new Error("Stack empty");
        }
        operation(stack);
      }
    ];
  }
}
function isNumber(str) {
  return !isNaN(parseInt(str, 10));
}
