export class ArgumentError extends Error {}

export class WordProblem {
  private operationsMap: {
    [index: string]: (x: number, y: number) => number;
  } = {
    plus: (x: number, y: number) => x + y,
    minus: (x: number, y: number) => x - y,
    "multiplied by": (x: number, y: number) => x * y,
    "divided by": (x: number, y: number) => x / y
  };

  private problem: string;

  constructor(problem: string) {
    this.problem = problem.replace("What is ", "").replace("?", "");
  }

  private parseTokens(): RegExpMatchArray | null {
    return this.problem.match(/(-?\d+|plus|minus|multiplied by|divided by)/g);
  }

  private parseEquation(): RegExpMatchArray {
    const tokens = this.parseTokens();

    if (!tokens || tokens.length < 3 || tokens.length % 2 == 0)
      throw new ArgumentError();

    return tokens;
  }

  private isOperand(token: string): boolean {
    return /(-?\d+)$/g.test(token);
  }

  private isOperator(token: string): boolean {
    return /^(plus|minus|multiplied by|divided by)$/g.test(token);
  }

  private solveEquation(equation: RegExpMatchArray) {
    let left = equation[0];

    if (!this.isOperand(left)) throw new ArgumentError();

    let answer = parseInt(left);

    for (let i = 1; i < equation.length; i += 2) {
      let [operator, right] = equation.slice(i, i + 2);

      if (!this.isOperator(operator) || !this.isOperand(right)) {
        throw new ArgumentError();
      }

      answer = this.operationsMap[operator](answer, parseInt(right));
    }

    return answer;
  }

  public answer(): number {
    const equation = this.parseEquation();
    return this.solveEquation(equation);
  }
}
