export class ArgumentError extends Error {}

export class WordProblem {
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

      switch (operator) {
        case "plus":
          answer += parseInt(right);
          break;
        case "minus":
          answer -= parseInt(right);
          break;
        case "multiplied by":
          answer *= parseInt(right);
          break;
        case "divided by":
          answer /= parseInt(right);
          break;
      }
    }

    return answer;
  }

  public answer(): number {
    const equation = this.parseEquation();
    return this.solveEquation(equation);
  }
}
