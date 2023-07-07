#include "allergies.h"

#include <algorithm>
#include <map>
#include <iostream>

const std::map<std::string, int> ALLERGENS{
    {"eggs", 1 << 0},
    {"peanuts", 1 << 1},
    {"shellfish", 1 << 2},
    {"strawberries", 1 << 3},
    {"tomatoes", 1 << 4},
    {"chocolate", 1 << 5},
    {"pollen", 1 << 6},
    {"cats", 1 << 7},
};

namespace allergies
{
    allergy_test::allergy_test(unsigned int score) : score(score) {}

    bool allergy_test::is_allergic_to(const std::string allergen) const
    {
        auto allergen_score = ALLERGENS.at(allergen);
        return (this->score & allergen_score) != 0;
    }

    std::unordered_set<std::string> allergy_test::get_allergies() const
    {
        std::unordered_set<std::string> allergies;

        for (auto allergen_with_score : ALLERGENS)
        {
            if (this->is_allergic_to(allergen_with_score.first))
                allergies.emplace(allergen_with_score.first);
        }

        return allergies;
    }
} // namespace allergies
