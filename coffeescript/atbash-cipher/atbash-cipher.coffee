class AtbashCipher
  @encode: (phrase) ->
    AtbashCipher.chunk (AtbashCipher.decode phrase)

  @decode: (phrase) ->
    (AtbashCipher.encodeChar c for c in phrase).join ''

  @encodeChar: (c) ->
    switch
      when /[a-z]/i.test(c) then String.fromCharCode('z'.charCodeAt() - (c.toLowerCase().charCodeAt() - 'a'.charCodeAt()))
      when /\d/.test(c) then c
      else ''

  @chunk: (phrase) ->
    phrase.match(/.{1,5}/g).join(' ')

module.exports = AtbashCipher
