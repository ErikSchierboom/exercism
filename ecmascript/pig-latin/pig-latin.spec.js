import PigLatin from './pig-latin';

describe('Pig Latin', () => {
  const translator = new PigLatin();

  it('translates a word beginning with a', () => {
    expect(translator.translate('apple')).toEqual('appleay');
  });

  it('translates a word beginning with e', () => {
    expect(translator.translate('ear')).toEqual('earay');
  });

  it('translates a word beginning with p', () => {
    expect(translator.translate('pig')).toEqual('igpay');
  });

  it('translates a word beginning with k', () => {
    expect(translator.translate('koala')).toEqual('oalakay');
  });

  it('translates a word beginning with ch', () => {
    expect(translator.translate('chair')).toEqual('airchay');
  });

  it('translates a word beginning with qu', () => {
    expect(translator.translate('queen')).toEqual('eenquay');
  });

  it('translates a word with a consonant preceding qu', () => {
    expect(translator.translate('square')).toEqual('aresquay');
  });

  it('translates a word beginning with th', () => {
    expect(translator.translate('therapy')).toEqual('erapythay');
  });

  it('translates a word beginning with thr', () => {
    expect(translator.translate('thrush')).toEqual('ushthray');
  });

  it('translates a word beginning with sch', () => {
    expect(translator.translate('school')).toEqual('oolschay');
  });

  it('translates a phrase', () => {
    expect(translator.translate('quick fast run'))
      .toEqual('ickquay astfay unray');
  });

});
