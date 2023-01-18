module RnaComplement
  def self.of_dna(dna)
    dna.tr("GCTA", "CGAU")
  end
end
