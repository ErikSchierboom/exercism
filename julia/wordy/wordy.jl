const isvalidregex = r"^What is \-?\d+( (plus|minus|multiplied by|divided by) \-?\d+)*\?$"
const operators = Dict("plus" => +, "minus" => -, "multiplied" => *, "divided" => ÷)

function wordy(problem)
    occursin(isvalidregex, problem) || throw(ArgumentError("Invalid problem"))

    parts = replace(problem, "What is " => "", "?" => "", " by" => "") |> split
    result = parse(Int, parts[1])

    for i in 2:2:length(parts)
        result = operators[parts[i]](result, parse(Int, parts[i+1]))
    end

    result
end
