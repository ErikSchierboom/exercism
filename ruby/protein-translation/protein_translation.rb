class InvalidCodonError < StandardError
end

module Translation
  def self.of_codon(codon)
    raise InvalidCodonError unless CODONS_TO_PROTEINS.key?(codon)

    CODONS_TO_PROTEINS[codon]
  end

  def self.of_rna(rna)
    rna
      .scan(/.{3}/)
      .map(&method(:of_codon))
      .take_while { |protein| protein != 'STOP' }
  end

  private
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
end