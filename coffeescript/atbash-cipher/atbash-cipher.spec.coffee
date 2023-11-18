Atbash = require './atbash-cipher'

describe 'Atbash', ->
  it 'encodes yes', ->
    expect(Atbash.encode('yes')).toBe 'bvh'

  it 'encodes no', ->
    expect(Atbash.encode('no')).toBe 'ml'

  it 'encodes OMG', ->
    expect(Atbash.encode('OMG')).toBe 'lnt'

  it 'encodes O M G', ->
    expect(Atbash.encode('O M G')).toBe 'lnt'

  it 'encodes a long word', ->
    expect(Atbash.encode('mindblowingly')).toBe 'nrmwy oldrm tob'

  it 'encodes numbers', ->
    expect(Atbash.encode('Testing, 1 2 3, testing.')).toBe 'gvhgr mt123 gvhgr mt'

  it 'encodes sentence', ->
    expect(Atbash.encode('Truth is fiction.')).toBe 'gifgs rhurx grlm'

  it 'encodes all the things', ->
    expect(Atbash.encode('The quick brown fox jumps over the lazy dog.')).toBe 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'

  it 'decodes exercism', ->
    expect(Atbash.decode('vcvix rhn')).toBe 'exercism'

  it 'decodes a sentence', ->
    expect(Atbash.decode('zmlyh gzxov rhlug vmzhg vkkrm thglm v')).toBe 'anobstacleisoftenasteppingstone'

  it 'decodes numbers', ->
    expect(Atbash.decode('gvhgr mt123 gvhgr mt')).toBe 'testing123testing'

  it 'decodes all the letter', ->
    expect(Atbash.decode('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt')).toBe 'thequickbrownfoxjumpsoverthelazydog'

  it 'decodes with too many spaces', ->
    expect(Atbash.decode('vc vix    r hn')).toBe 'exercism'

  it 'decodes with no spaces', ->
    expect(Atbash.decode('zmlyhgzxovrhlugvmzhgvkkrmthglmv')).toBe 'anobstacleisoftenasteppingstone'
