class Nucleotide
  attr_reader :histogram

  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    @histogram = to_histogram(dna)
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  private

  def to_histogram(dna)
    empty_histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }

    dna.each_char.each_with_object(empty_histogram) do |nucleotide, histogram|
      raise ArgumentError, 'Unknown nucleotide' unless histogram.include?(nucleotide)

      histogram[nucleotide] += 1
    end
  end
end