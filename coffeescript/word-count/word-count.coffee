class WordCount
  constructor: (@sentence) ->

  count: ->
    @sentence
      .toLowerCase()
      .match(/(\w+('?\w)*)/g)
      .reduce ((counts, word) ->
        counts[word] = (counts[word] ? 0) + 1
        counts
      ), {}

module.exports = WordCount
