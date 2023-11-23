PascalsTriangle = require './pascals-triangle'

describe 'Pascal', ->
  it 'one row', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(0)).toEqual []

  it 'two rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(1)).toEqual [[1]]

  it 'three rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(2)).toEqual [[1], [1,1]]

  it 'four rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(3)).toEqual [[1], [1,1], [1,2,1]]

  it 'five rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(4)).toEqual [[1], [1,1], [1,2,1], [1,3,3,1]]

  it 'five rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(5)).toEqual [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1]]

  it 'six rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(6)).toEqual [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1], [1, 5, 10, 10, 5, 1]]

  it 'ten rows', ->
    pascal = new PascalsTriangle()
    expect(pascal.rows(10)).toEqual [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]]
