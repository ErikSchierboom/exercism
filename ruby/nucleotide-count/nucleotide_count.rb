class Nucleotide
  EMPTY_HISTOGRAM = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }.freeze
  private_constant :EMPTY_HISTOGRAM

  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    raise ArgumentError, 'Unknown nucleotide' unless dna =~ /^[ATCG]*$/

    @dna = dna
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  def histogram
    dna
      .each_char
      .each_with_object(Hash[EMPTY_HISTOGRAM]) { |nucleotide, histogram| histogram[nucleotide] += 1 }
  end

  private

  attr_reader :dna
end