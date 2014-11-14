Example = require "./example"
describe "Example", ->
  example = new Example()
  it "add 2 and 2", ->
    result = example.add 2, 2
    expect(result).toEqual 4
    
  it "add 12 and 24", ->
    result = example.add 12, 24
    expect(result).toEqual 36
    
  it "add 100 and 1", ->
    result = example.add 100, 1
    expect(result).toEqual 101
    
  it "add 2 and -2", ->
    result = example.add 2, -2
    expect(result).toEqual 0
