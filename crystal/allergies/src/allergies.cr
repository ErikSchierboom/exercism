module Allergies
  def self.allergic_to(allergen, allergy_score)
    list(allergy_score).includes?(allergen)
  end

  def self.list(allergy_score)
    Allergen.values
      .select(&.allergic_to?(allergy_score))
      .map(&.to_s)
      .map(&.downcase)
  end

  @[Flags]
  enum Allergen
    Eggs
    Peanuts
    Shellfish
    Strawberries
    Tomatoes
    Chocolate
    Pollen
    Cats

    def allergic_to?(allergy_score)
      (allergy_score & self.value) == self.value
    end
  end
end
