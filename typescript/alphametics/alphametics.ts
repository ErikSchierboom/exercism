export default class Alphametics {
  private puzzle: string;

  constructor(puzzle: string) {
    this.puzzle = puzzle;
  }

  solve(): object | undefined {
    const equation = this.parse(this.puzzle);
    const solver = new AlphameticsSolver(equation);
    return solver.solve();
  }

  private parse(equation: string) {
    const [left, right] = equation.split(" == ");
    const leftParts = left.split(" + ");
    const rightParts = right.split(" + ");
    return new AlphameticsEquation(leftParts, rightParts);
  }
}

class AlphameticsEquation {
  public LettersWithCount = new Map<string, number>();
  public NonZeroLetters = new Set<string>();

  constructor(left: string[], right: string[]) {
    left.forEach(leftOperand => this.processOperand(leftOperand, 1));
    right.forEach(rightOperand => this.processOperand(rightOperand, -1));
  }

  private processOperand(operand: string, multiplyCountBy: number): void {
    let letterCount = multiplyCountBy;

    for (let i = operand.length - 1; i >= 0; i--) {
      const letter = operand[i];

      const existingCount = this.LettersWithCount.get(letter) || 0;
      this.LettersWithCount.set(letter, existingCount + letterCount);

      letterCount *= 10;
    }

    this.NonZeroLetters.add(operand[0]);
  }
}

class AlphameticsSolver {
  private equation: AlphameticsEquation;

  constructor(equation: AlphameticsEquation) {
    this.equation = equation;
  }

  public solve(): object | undefined {
    const combinations = this.letterCountCombinations();
    const index = combinations.findIndex(combination =>
      this.isSolution(combination)
    );
    return index === -1 ? undefined : this.toSolution(combinations[index]);
  }

  private letterCountCombinations(): number[][] {
    return permutations(
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      this.equation.LettersWithCount.size
    );
  }

  private isSolution(letterCountCombination: number[]): boolean {
    const letterCounts = Array.from(this.equation.LettersWithCount.values());
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

    const letterAtZeroIndex = Array.from(this.equation.LettersWithCount.keys())[
      zeroIndex
    ];

    return !this.equation.NonZeroLetters.has(letterAtZeroIndex);
  }

  private toSolution(letterCountCombination: number[]): object {
    const solution: any = {};

    const letters = Array.from(this.equation.LettersWithCount.keys());
    for (let i = 0; i < letters.length; i++) {
      solution[letters[i]] = letterCountCombination[i];
    }

    return solution;
  }
}

function permutations<T>(array: T[], k: number): T[][] {
  const perms: T[][] = [];
  const combinations: T[] = [];
  const indices: boolean[] = [];

  function run(level: number) {
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
