import translate from './protein-translation';

describe('ProteinTranslation', () => {
  test('Empty RNA has no proteins', () => {
    expect(translate()).toEqual([]);
  });

  test('Methionine codon translates into protein', () => {
    expect(translate('AUG')).toEqual(['Methionine']);
  });

  test('Phenylalanine codons translate into protein', () => {
    expect(translate('UUUUUC')).toEqual(['Phenylalanine', 'Phenylalanine']);
  });

  test('Leucine codons translate into protein', () => {
    expect(translate('UUAUUG')).toEqual(['Leucine', 'Leucine']);
  });

  test('Serine codons translate into protein', () => {
    expect(translate('UCUUCCUCAUCG')).toEqual(['Serine', 'Serine', 'Serine', 'Serine']);
  });

  test('Tyrosine codons translate into protein', () => {
    expect(translate('UAUUAC')).toEqual(['Tyrosine', 'Tyrosine']);
  });

  test('Cysteine codons translate into protein', () => {
    expect(translate('UGUUGC')).toEqual(['Cysteine', 'Cysteine']);
  });

  test('Tryptophan codon translates into protein', () => {
    expect(translate('UGG')).toEqual(['Tryptophan']);
  });

  test('Sequence starts with stop codon 1', () => {
    expect(translate('UAAUUUUUA')).toEqual([]);
  });

  test('Sequence starts with stop codon 2', () => {
    expect(translate('UAGAUGUAU')).toEqual([]);
  });

  test('Sequence starts with stop codon 3', () => {
    expect(translate('UGAUGU')).toEqual([]);
  });

  test('Small RNA strand', () => {
    expect(translate('AUGUUUUCU')).toEqual(['Methionine', 'Phenylalanine', 'Serine']);
  });

  test('Stop codon ends translation', () => {
    expect(translate('AUGUUUUCUUAAAUG')).toEqual(['Methionine', 'Phenylalanine', 'Serine']);
  });

  test('Invalid codon throws error', () => {
    expect(() => translate('LOL')).toThrow(new Error('Invalid codon'));
  });
});
