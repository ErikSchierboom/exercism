#include "high_scores.h"

#include <algorithm>

namespace arcade {

    std::vector<int> HighScores::list_scores() {
        return scores;
    }

    int HighScores::latest_score() {
        return scores.back();
    }

    int HighScores::personal_best() {
        return *std::max_element(scores.begin(), scores.end());
    }

    std::vector<int> HighScores::top_three() {
        std::vector<int> top_three(std::min(3, (int)scores.size()));
        std::partial_sort_copy(scores.begin(), scores.end(), top_three.begin(), top_three.end(), std::greater<int>());
        return top_three;
    }

}  // namespace arcade
