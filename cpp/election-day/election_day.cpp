#include <string>
#include <vector>
#include <algorithm>

namespace election
{

    // The election result struct is already created for you:

    struct ElectionResult
    {
        // Name of the candidate
        std::string name{};
        // Number of votes the candidate has
        int votes{};
    };

    // vote_count takes a reference to an `ElectionResult` as an argument and will
    // return the number of votes in the `ElectionResult.
    int vote_count(ElectionResult &election_result)
    {
        return election_result.votes;
    }

    // increment_vote_count takes a reference to an `ElectionResult` as an argument
    // and a number of votes (int), and will increment the `ElectionResult` by that
    // number of votes.
    void increment_vote_count(ElectionResult &election_result, int number_of_votes)
    {
        election_result.votes += number_of_votes;
    }

    // determine_result receives the reference to a final_count and returns a
    // reference to the `ElectionResult` of the new president. It also changes the
    // name of the winner by prefixing it with "President". The final count is given
    // in the form of a `reference` to `std::vector<ElectionResult>`, a vector with
    // `ElectionResults` of all the participating candidates.
    ElectionResult &determine_result(std::vector<ElectionResult> &election_results)
    {
        ElectionResult &result = election_results.front();

        for (int i{1}; i < election_results.size(); ++i)
            if (election_results.at(i).votes > result.votes)
                result = election_results.at(i);

        result.name = "President " + result.name;

        return result;
    }

} // namespace election
