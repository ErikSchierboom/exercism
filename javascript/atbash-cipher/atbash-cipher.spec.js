import atbash from './atbash-cipher';

describe('encode', () => {
  test('encodes no', () => expect(atbash.encode('no')).toEqual('ml'));

  test('encodes yes', () => expect(atbash.encode('yes')).toEqual('bvh'));

  test('encodes OMG', () => expect(atbash.encode('OMG')).toEqual('lnt'));

  test('encodes O M G', () => expect(atbash.encode('O M G')).toEqual('lnt'));

  test('encodes long words', () => expect(atbash.encode('mindblowingly')).toEqual('nrmwy oldrm tob'));

  test('encodes numbers', () => expect(atbash.encode('Testing, 1 2 3, testing.'))
    .toEqual('gvhgr mt123 gvhgr mt'));

  test('encodes sentences', () => expect(atbash.encode('Truth is fiction.')).toEqual('gifgs rhurx grlm'));

  test('encodes all the things', () => expect(atbash.encode('The quick brown fox jumps over the lazy dog.'))
    .toEqual('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'),
  );
});
