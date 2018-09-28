import SimpleCipher from './simple-cipher'

describe('Random key generation', () => {
    it('generates keys at random', () => {
        // Strictly speaking, this is difficult to test with 100% certainty.
        // But, if you have a generator that generates 100-character-long
        // strings of lowercase letters at random, the odds of two consecutively
        // generated keys being identical are astronomically low.
        expect(new SimpleCipher().key).not.toEqual(new SimpleCipher().key)
    })
})

describe('Random key cipher', () => {
    const simpleCipher = new SimpleCipher()

    it('has a key made of letters', () => {
        expect(simpleCipher.key).toMatch(/^[a-z]+$/)
    })

    it('has a key that is at least 100 characters long', () => {
        expect(simpleCipher.key.length).toBeGreaterThanOrEqual(100)
    })

    // Here we take advantage of the fact that plaintext of "aaa..."
    // outputs the key. This is a critical problem with shift ciphers, some
    // characters will always output the key verbatim.
    it('can encode', () => {
        expect(simpleCipher.encode('aaaaaaaaaa')).toEqual(simpleCipher.key.substr(0, 10))
    })

    it('can decode', () => {
        expect(simpleCipher.decode(simpleCipher.key.substr(0, 10))).toEqual('aaaaaaaaaa')
    })

    it('is reversible', () => {
        const plaintext = 'abcdefghij'
        expect(simpleCipher.decode(simpleCipher.encode(plaintext))).toEqual(plaintext)
    })
})

describe('Incorrect key cipher', () => {
    it('throws an error with an all caps key', () => {
        expect(() => {
            new SimpleCipher('ABCDEF')
        }).toThrowError('Bad key')
    })

    it('throws an error with a mixed case key', () => {
        expect(() => {
            new SimpleCipher('AbcdEF')
        }).toThrowError('Bad key')
    })

    it('throws an error with a numeric key', () => {
        expect(() => {
            new SimpleCipher('12345')
        }).toThrow('Bad key')
    })

    it('throws an error with an empty key', () => {
        expect(() => {
            new SimpleCipher('')
        }).toThrow('Bad key')
    })
})

describe('Substitution cipher', () => {
    const key = 'abcdefghij'
    const simpleCipher = new SimpleCipher(key)

    it('keeps the submitted key', () => {
        expect(simpleCipher.key).toEqual(key)
    })

    it('can encode', () => {
        expect(simpleCipher.encode('aaaaaaaaaa')).toEqual('abcdefghij')
    })

    it('can decode', () => {
        expect(simpleCipher.decode('abcdefghij')).toEqual('aaaaaaaaaa')
    })

    it('is reversible', () => {
        expect(simpleCipher.decode(simpleCipher.encode('abcdefghij'))).toEqual('abcdefghij')
    })

    it(': double shift encode', () => {
        expect(new SimpleCipher('iamapandabear').encode('iamapandabear'))
            .toEqual('qayaeaagaciai')
    })

    it('can wrap on encode', () => {
        expect(simpleCipher.encode('zzzzzzzzzz')).toEqual('zabcdefghi')
    })

    it('can wrap on decode', () => {
        expect(simpleCipher.decode('zabcdefghi')).toEqual('zzzzzzzzzz')
    })

    it('can handle messages longer than the key (encode)', () => {
        expect(new SimpleCipher('abc').encode('iamapandabear'))
            .toEqual('iboaqcnecbfcr')
    })

    it('can handle messages longer than the key (decode)', () => {
        expect(new SimpleCipher('abc').decode('iboaqcnecbfcr'))
            .toEqual('iamapandabear')
    })
})
