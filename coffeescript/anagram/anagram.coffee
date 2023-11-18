class Anagram
  constructor: (source) ->
    @lowercasedSource = source.toLowerCase()
    @normalizedSource = this.normalize(source)

  match: (targets) ->
    target for target in targets when this.isAnagram target

  isAnagram: (target) ->
    this.normalize(target) == @normalizedSource &&
    target.toLowerCase() != @lowercasedSource

  normalize: (str) ->
    str.toLowerCase()
       .split ''
       .sort()
       .join ''

module.exports = Anagram
