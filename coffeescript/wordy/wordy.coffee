class WordProblem
  ERROR:
    unknownOperation: new Error("Unknown operation")
    syntaxError: new Error("Syntax error")

  constructor: (question) ->
    question = question
      .replace /^What is\s?/, ''
      .replace /\?$/, ''
    @tokens = if question.length == 0 then [] else question.split(' ').reverse()

  answer: ->
    result = parseInt @tokens.pop() ? throw this.ERROR.syntaxError
    
    while token = @tokens.pop()
      switch token
        when 'plus'
          throw this.ERROR.syntaxError if Number.isNaN(operand = parseInt @tokens.pop())
          result += operand
        when 'minus'
          throw this.ERROR.syntaxError if Number.isNaN(operand = parseInt @tokens.pop())
          result -= operand
        when 'multiplied'
          throw this.ERROR.syntaxError if @tokens.pop() != 'by'
          throw this.ERROR.syntaxError if Number.isNaN(operand = parseInt @tokens.pop())
          result *= operand
        when 'divided'
          throw this.ERROR.syntaxError if @tokens.pop() != 'by'
          throw this.ERROR.syntaxError if Number.isNaN(operand = parseInt @tokens.pop())
          result /= operand
        else
          throw this.ERROR.syntaxError if !Number.isNaN(parseInt token)
          throw this.ERROR.unknownOperation

    result

module.exports = WordProblem
