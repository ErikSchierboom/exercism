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

  ALLERGENS = {
    'eggs'         => 0b00000001,
    'peanuts'      => 0b00000010,
    'shellfish'    => 0b00000100,
    'strawberries' => 0b00001000,
    'tomatoes'     => 0b00010000,
    'chocolate'    => 0b00100000,
    'pollen'       => 0b01000000,
    'cats'         => 0b10000000,
  }.freeze
  private_constant :ALLERGENS
end