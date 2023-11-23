WordCount = require './word-count'

describe 'WordCount', ->
  it 'count one word', ->
    words = new WordCount 'word'
    expect(words.count()).toEqual
      word: 1

  it 'count one of each word', ->
    words = new WordCount 'one of each'
    expect(words.count()).toEqual
      one: 1
      of: 1
      each: 1

  it 'multiple occurrences of a word', ->
    words = new WordCount 'one fish two fish red fish blue fish'
    expect(words.count()).toEqual
      one: 1
      fish: 4
      two: 1
      red: 1
      blue: 1

  it 'handles cramped lists', ->
    words = new WordCount 'one,two,three'
    expect(words.count()).toEqual
      one: 1,
      two: 1,
      three: 1

  it 'handles expanded lists', ->
    words = new WordCount 'one,\ntwo,\nthree'
    expect(words.count()).toEqual
      one: 1,
      two: 1,
      three: 1

  it 'ignore punctuation', ->
    words = new WordCount 'car: carpet as java: javascript!!&@$%^&'
    expect(words.count()).toEqual
      car: 1,
      carpet: 1,
      as: 1,
      java: 1,
      javascript: 1

  it 'include numbers', ->
    words = new WordCount 'testing, 1, 2 testing'
    expect(words.count()).toEqual
      testing: 2,
      1: 1,
      2: 1

  it '"normalize case', ->
    words = new WordCount 'go Go GO Stop stop'
    expect(words.count()).toEqual
      go: 3,
      stop: 2

  it 'with apostrophes', ->
    words = new WordCount "'First: don't laugh. Then: don't cry. You're getting it.'"
    expect(words.count()).toEqual
      first: 1,
      "don't": 2,
      laugh: 1,
      then: 1,
      cry: 1,
      "you're": 1,
      getting: 1,
      it: 1

  it 'with quotations', ->
    words = new WordCount "Joe can't tell between 'large' and large."
    expect(words.count()).toEqual
      joe: 1,
      "can't": 1,
      tell: 1,
      between: 1,
      large: 2,
      and: 1

  it 'substrings from the beginning', ->
    words = new WordCount "Joe can't tell between app, apple and a."
    expect(words.count()).toEqual
      joe: 1,
      "can't": 1,
      tell: 1,
      between: 1,
      app: 1,
      apple: 1,
      and: 1,
      a: 1

  it 'multiple spaces not detected as a word', ->
    words = new WordCount ' multiple   whitespaces'
    expect(words.count()).toEqual
      multiple: 1,
      whitespaces: 1

  it 'alternating word separators not detected as a word', ->
    words = new WordCount ",\n,one,\n ,two \n 'three'"
    expect(words.count()).toEqual
      one: 1,
      two: 1,
      three: 1

  it 'quotation for word with apostrophe', ->
    words = new WordCount "can, can't, 'can't'"
    expect(words.count()).toEqual
      can: 1,
      "can't": 2

