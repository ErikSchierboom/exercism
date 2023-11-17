class WordCount
  constructor: (@sentence) ->

  count: ->
    counts = {}

    for match in @sentence.toLowerCase().match(/(\w+('?\w)*)/g)
      counts[match] ?= 0
      counts[match]++

    counts

module.exports = WordCount
