class Nucleotide
  def self.from_dna(dna) = new(dna)

  def initialize(dna)
    raise ArgumentError, 'Unknown nucleotide' unless dna =~ /^[ATCG]*$/

    @dna = dna
  end

  def count(nucleotide) = histogram[nucleotide]
  def histogram = EMPTY_HISTOGRAM.merge(@dna.chars.tally)

  private
  EMPTY_HISTOGRAM = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }.freeze
end