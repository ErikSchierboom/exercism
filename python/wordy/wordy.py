class Solver:
    def __init__(self, question):
        self.question = question
        self.parts = []

    def answer(self):
        if not self.question.startswith("What is") or not self.question.endswith("?"):
            raise ValueError("unknown operation")

        self.parts = self.question.removeprefix("What is").removesuffix("?").split()
        if len(self.parts) == 0:
            raise ValueError("syntax error")

        self.parts.reverse()

        result = self.pop_operand()

        while len(self.parts) > 0:
            match self.pop_operator():
                case "add":
                    result += self.pop_operand()
                case "subtract":
                    result -= self.pop_operand()
                case "multiply":
                    result *= self.pop_operand()
                case "divide":
                    result /= self.pop_operand()

        if len(self.parts) > 0:
            raise ValueError("syntax error")

        return result

    def pop_operand(self):
        try:
            return int(self.parts.pop())
        except:
            raise ValueError("syntax error")

    def pop_operator(self):
        match self.parts.pop():
            case "plus":
                return "add"
            case "minus":
                return "subtract"
            case "multiplied" if self.parts.pop() == "by":
                return "multiply"
            case "divided" if self.parts.pop() == "by":
                return "divide"
            case part:
                try:
                    int(part)
                except ValueError:
                    raise ValueError("unknown operation")

                raise ValueError("syntax error")

def answer(question):
    return Solver(question).answer()
