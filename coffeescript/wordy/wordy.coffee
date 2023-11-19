class WordProblem
  ERROR:
    unknownOperation: new Error("Unknown operation")
    syntaxError: new Error("Syntax error")

  constructor: (question) ->
    question = question
      .replace /^What is\s?/, ''
      .replace /\?$/, ''
    @tokens = if question.length == 0 then [] else question.split ' '

  answer: ->
    throw this.ERROR.syntaxError if @tokens.length == 0

    result = parseInt @tokens[0]
    i = 1

    while i < @tokens.length
      switch @tokens[i]
        when 'plus'
          throw this.ERROR.syntaxError if i == @tokens.length - 1
          throw this.ERROR.syntaxError if Number.isNaN(parseInt(@tokens[i + 1]))
          result += parseInt @tokens[i + 1]
          i += 2
        when 'minus'
          throw this.ERROR.syntaxError if i == @tokens.length - 1
          throw this.ERROR.syntaxError if Number.isNaN(parseInt(@tokens[i + 1]))
          result -= parseInt @tokens[i + 1]
          i += 2
        when 'multiplied'
          throw this.ERROR.syntaxError if i == @tokens.length - 2
          throw this.ERROR.syntaxError if Number.isNaN(parseInt(@tokens[i + 2]))
          result *= parseInt @tokens[i + 2]
          i += 3
        when 'divided'
          throw this.ERROR.syntaxError if i == @tokens.length - 2
          throw this.ERROR.syntaxError if Number.isNaN(parseInt(@tokens[i + 2]))
          result /= parseInt @tokens[i + 2]
          i += 3
        else
          throw this.ERROR.syntaxError if !Number.isNaN(parseInt(@tokens[i]))
          throw this.ERROR.unknownOperation

    result

module.exports = WordProblem
