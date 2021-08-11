class Allergies
  def initialize(coded_allergens)
    @allergens = ALLERGENS.select.with_index do |allergen, left_shift|
      coded_allergens.anybits?(1 << left_shift)
    end
  end

  def allergic_to?(allergen)
    allergens.include?(allergen)
  end

  def list
    allergens
  end

  private
  attr_reader :allergens

  ALLERGENS = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats].freeze
  private_constant :ALLERGENS
end