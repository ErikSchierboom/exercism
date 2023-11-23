class Bob
  hey: (message) ->
    switch
      when this.isSilent(message) then "Fine. Be that way!"
      when this.isShout(message) && this.isQuestion(message) then "Calm down, I know what I'm doing!"
      when this.isShout(message) then "Whoa, chill out!"
      when this.isQuestion(message) then "Sure."
      else "Whatever."

  isSilent: (message) -> message.trim().length == 0
  isQuestion: (message) -> message.trimEnd().endsWith("?")
  isShout: (message) -> message.toUpperCase() == message && message != message.toLowerCase()

module.exports = Bob
