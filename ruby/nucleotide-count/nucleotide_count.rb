class Nucleotide
  attr_reader :histogram

  def initialize(histogram)
    @histogram = histogram
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  class << Nucleotide
    def from_dna(dna)
      Nucleotide.new(to_histogram(dna))
    end

    def to_histogram(dna)
      empty_histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }

      dna.each_char.each_with_object(empty_histogram) do |nucleotide, histogram|
        raise ArgumentError, 'Unknown nucleotide' unless empty_histogram.include?(nucleotide)

        histogram[nucleotide] += 1
      end
    end
  end
end