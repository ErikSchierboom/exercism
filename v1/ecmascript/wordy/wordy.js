export class ArgumentError extends Error {
}

export class WordProblem {
    constructor(problem) {
        this.problem = problem
            .replace('What is ', '')
            .replace('?', '');
    }

    parseTokens() {
        return this.problem.match(/(-?\d+|plus|minus|multiplied by|divided by)/g);
    }

    parseEquation() {
        const tokens = this.parseTokens();

        if (!tokens || tokens.length < 3 || tokens.length % 2 == 0)
            throw new ArgumentError();
        
        return tokens;
    }

    isOperand(token) {
        return /(-?\d+)$/g.test(token);
    }

    isOperator(token) {
        return /^(plus|minus|multiplied by|divided by)$/g.test(token);
    }

    solveEquation(equation) {
        let left = equation[0];

        if (!this.isOperand(left))
            throw new ArgumentError();

        let answer = parseInt(left);

        for (let i = 1; i < equation.length; i+= 2) {
            let [operator, right] = equation.slice(i, i + 2);

            if (!this.isOperator(operator) || !this.isOperand(right))
                throw new ArgumentError();
            
            switch (operator) {
                case 'plus':
                    answer += parseInt(right);
                    break;
                case 'minus':
                    answer -= parseInt(right);
                    break;
                case 'multiplied by':
                    answer *= parseInt(right);
                    break;
                case 'divided by':
                    answer /= parseInt(right);
                    break;
            }
        }

        return answer;
    }

    answer() {
        const equation = this.parseEquation();
        return this.solveEquation(equation); 
    }
}