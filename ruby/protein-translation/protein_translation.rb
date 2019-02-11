class InvalidCodonError < StandardError
end

module Translation
  CODONS_TO_PROTEINS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze
  private_constant :CODONS_TO_PROTEINS

  def self.of_codon(codon)
    raise InvalidCodonError, 'Invalid codon' unless CODONS_TO_PROTEINS.key?(codon)

    CODONS_TO_PROTEINS[codon]
  end

  def self.of_rna(rna)
    rna
      .scan(/.{3}/)
      .map { |codon| of_codon(codon) }
      .take_while { |protein| protein != 'STOP' }
  end
end