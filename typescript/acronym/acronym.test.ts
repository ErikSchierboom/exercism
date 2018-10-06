import Acronym from './acronym'

describe('Acronym are produced from', () => {
  it('title cased phrases', () => {
    expect(Acronym.parse('Portable Network Graphics')).toEqual('PNG')
  })

  it('other title cased phrases', () => {
    expect(Acronym.parse('Ruby on Rails')).toEqual('ROR')
  })

  it('inconsistently cased phrases', () => {
    expect(Acronym.parse('HyperText Markup Language')).toEqual('HTML')
  })

  it('phrases with punctuation', () => {
    expect(Acronym.parse('First In, First Out')).toEqual('FIFO')
  })

  it('other phrases with punctuation', () => {
    expect(Acronym.parse('PHP: Hypertext Preprocessor')).toEqual('PHP')
  })

  it('phrases with punctuation and sentence casing', () => {
    expect(Acronym.parse('Complementary metal-oxide semiconductor')).toEqual('CMOS')
  })
})
