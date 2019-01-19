export function solve(puzzle) {
  const equation = parse(puzzle);
  const solver = new AlphameticsSolver(equation);
  return solver.solve();
}

function parse(equation) {
  const [left, right] = equation.split(" == ");
  const leftParts = left.split(" + ");
  const rightParts = right.split(" + ");
  return new AlphameticsEquation(leftParts, rightParts);
}

class AlphameticsEquation {
  constructor(left, right) {
    this.lettersWithCount = new Map();
    this.nonZeroLetters = new Set();
    left.forEach(leftOperand => this.processOperand(leftOperand, 1));
    right.forEach(rightOperand => this.processOperand(rightOperand, -1));
  }

  processOperand(operand, multiplyCountBy) {
    let letterCount = multiplyCountBy;

    for (let i = operand.length - 1; i >= 0; i--) {
      const letter = operand[i];

      const existingCount = this.lettersWithCount.get(letter) || 0;
      this.lettersWithCount.set(letter, existingCount + letterCount);

      letterCount *= 10;
    }

    this.nonZeroLetters.add(operand[0]);
  }
}

class AlphameticsSolver {
  constructor(equation) {
    this.equation = equation;
  }

  solve() {
    const combinations = this.letterCountCombinations();
    const index = combinations.findIndex(combination =>
      this.isSolution(combination)
    );
    return index === -1 ? null : this.toSolution(combinations[index]);
  }

  letterCountCombinations() {
    return permutations(
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      this.equation.lettersWithCount.size
    );
  }

  isSolution(letterCountCombination) {
    const letterCounts = Array.from(this.equation.lettersWithCount.values());
    const sum = letterCounts.reduce(
      (sum, count, index) => sum + count * letterCountCombination[index],
      0
    );

    if (sum !== 0) {
      return false;
    }

    const zeroIndex = letterCountCombination.indexOf(0);
    if (zeroIndex === -1) {
      return true;
    }

    const letterAtZeroIndex = Array.from(this.equation.lettersWithCount.keys())[
      zeroIndex
    ];

    return !this.equation.nonZeroLetters.has(letterAtZeroIndex);
  }

  toSolution(letterCountCombination) {
    const solution = {};

    const letters = Array.from(this.equation.lettersWithCount.keys());
    for (let i = 0; i < letters.length; i++) {
      solution[letters[i]] = letterCountCombination[i];
    }

    return solution;
  }
}

function permutations(array, k) {
  const perms = [];
  const combinations = [];
  const indices = [];

  function run(level) {
    for (var i = 0; i < array.length; i++) {
      if (!indices[i]) {
        indices[i] = true;

        combinations[level] = array[i];

        if (level < k - 1) {
          run(level + 1);
        } else {
          perms.push(Array.from(combinations));
        }

        indices[i] = false;
      }
    }
  }

  run(0);

  return perms;
}
