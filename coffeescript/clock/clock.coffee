class Clock
  constructor: (hours, minutes = 0) ->
    normalized = (hours * 60 + minutes) %% 1440
    @hours = normalized // 60
    @minutes = normalized %% 60
    
  plus: (minutes) ->
    new Clock(@hours, @minutes + minutes)

  minus: (minutes) ->
    new Clock(@hours, @minutes - minutes)

  equals: (other) ->
    @hours == other.hours && @minutes == other.minutes

  toString: ->
    hoursString = @hours.toString().padStart(2, '0')
    minutesString = @minutes.toString().padStart(2, '0')
    "#{hoursString}:#{minutesString}"

module.exports = Clock
