using Statistics

rationalize(successes, trials) = successes .// trials

probabilities(successes, trials) = successes ./ trials

function checkmean(successes, trials)
    rational_mean = mean(rationalize(successes, trials))
    real_mean = mean(probabilities(successes, trials))

    if float.(rational_mean) == real_mean
        return true
    end

    rational_mean
end

function checkprob(successes, trials)
    rational_sum = prod(rationalize(successes, trials))
    real_sum = prod(probabilities(successes, trials))

    if float.(rational_sum) == real_sum
        return true
    end

    rational_sum
end
