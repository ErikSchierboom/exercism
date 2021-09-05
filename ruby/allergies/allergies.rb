class Allergies
  attr_reader :list

  def initialize(coded_allergens)
    @list = ALLERGENS.select.with_index do |_, left_shift|
      coded_allergens.anybits?(1 << left_shift)
    end
  end

  def allergic_to?(allergen)
    list.include?(allergen)
  end

  private
  ALLERGENS = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats].freeze
  private_constant :ALLERGENS
end