WordProblem = require './wordy'

describe 'Word Problem', ->

  it 'just a number', ->
    problem = new WordProblem('What is 5?')
    expect(problem.answer()).toEqual 5

  it 'addition', ->
    problem = new WordProblem('What is 1 plus 1?')
    expect(problem.answer()).toEqual 2

  it 'more addition', ->
    problem = new WordProblem('What is 53 plus 2?')
    expect(problem.answer()).toEqual 55

  it 'addition with negative numbers', ->
    problem = new WordProblem('What is -1 plus -10?')
    expect(problem.answer()).toEqual -11

  it 'large addition', ->
    problem = new WordProblem('What is 123 plus 45678?')
    expect(problem.answer()).toEqual 45801

  it 'subtraction', ->
    problem = new WordProblem('What is 4 minus -12?')
    expect(problem.answer()).toEqual 16
  
  it 'multiplication', ->
    problem = new WordProblem('What is -3 multiplied by 25?')
    expect(problem.answer()).toEqual -75

  it 'division', ->
    problem = new WordProblem('What is 33 divided by -3?')
    expect(problem.answer()).toEqual -11

  it 'multiple additions', ->
    problem = new WordProblem('What is 1 plus 1 plus 1?')
    expect(problem.answer()).toEqual 3

  it 'addition and subtraction', ->
    problem = new WordProblem('What is 1 plus 5 minus -2?')
    expect(problem.answer()).toEqual 8

  it 'multiple subtraction', ->
    problem = new WordProblem('What is 20 minus 4 minus 13?')
    expect(problem.answer()).toEqual 3

  it 'subtraction then addition', ->
    problem = new WordProblem('What is 17 minus 6 plus 3?')
    expect(problem.answer()).toEqual 14

  it 'multiple multiplication', ->
    problem = new WordProblem('What is 2 multiplied by -2 multiplied by 3?')
    expect(problem.answer()).toEqual -12

  it 'addition and multiplication', ->
    problem = new WordProblem('What is -3 plus 7 multiplied by -2?')
    expect(problem.answer()).toEqual -8

  it 'multiple division', ->
    problem = new WordProblem('What is -12 divided by 2 divided by -3?')
    expect(problem.answer()).toEqual 2

  it 'unknown operation', ->
    problem = new WordProblem('What is 52 cubed?')
    expect(-> problem.answer()).toThrow(problem.ERROR.unknownOperation)

  it 'Non math question', ->
    problem = new WordProblem('Who is the president of the United States?')
    expect(-> problem.answer()).toThrow(problem.ERROR.unknownOperation)

  it 'reject problem missing an operand', ->
    problem = new WordProblem('What is 1 plus?')
    expect(-> problem.answer()).toThrow(problem.ERROR.syntaxError)

  it 'reject problem with no operands or operators', ->
    problem = new WordProblem('What is?')
    expect(-> problem.answer()).toThrow(problem.ERROR.syntaxError)

  it 'reject two operations in a row', ->
    problem = new WordProblem('What is 1 plus plus 2?')
    expect(-> problem.answer()).toThrow(problem.ERROR.syntaxError)

  it 'reject two numbers in a row', ->
    problem = new WordProblem('What is 1 plus 2 1?')
    expect(-> problem.answer()).toThrow(problem.ERROR.syntaxError)

  it 'reject postfix notation', ->
    problem = new WordProblem('What is 1 2 plus?')
    expect(-> problem.answer()).toThrow(problem.ERROR.syntaxError)

  it 'reject prefix notation', ->
    problem = new WordProblem('What is plus 1 2?')
    expect(-> problem.answer()).toThrow(problem.ERROR.syntaxError)
