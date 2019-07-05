class Allergies
  def initialize(coded_allergens)
    @coded_allergens = coded_allergens
  end

  def allergic_to?(allergen)
    ALLERGENS[allergen].anybits?(coded_allergens)
  end

  def list
    ALLERGENS.select { |allergen, _| allergic_to?(allergen) }.keys
  end

  private

  attr_reader :coded_allergens

  def self.bit(n)
    1 << (n - 1)
  end

  ALLERGENS = {
      'eggs'         => bit(1),
      'peanuts'      => bit(2),
      'shellfish'    => bit(3),
      'strawberries' => bit(4),
      'tomatoes'     => bit(5),
      'chocolate'    => bit(6),
      'pollen'       => bit(7),
      'cats'         => bit(8),
  }.freeze
  private_constant :ALLERGENS
end