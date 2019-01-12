module Complement
  def self.of_dna(dna)
    dna.tr('GCTA', 'CGAU')
  end
end