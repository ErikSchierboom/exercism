function bob(stimulus)
    issilent(stimulus) && return "Fine. Be that way!"
    isshout(stimulus) && isquestion(stimulus) && return "Calm down, I know what I'm doing!"
    isshout(stimulus) && return "Whoa, chill out!"
    isquestion(stimulus) && return "Sure."

    "Whatever."
end

issilent(stimulus) = isempty(strip(stimulus))
isquestion(stimulus) = endswith(strip(stimulus), '?')
isshout(stimulus) = uppercase(stimulus) == stimulus && any(isletter, stimulus)
