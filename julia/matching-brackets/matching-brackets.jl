OPEN_TO_CLOSE = Dict('[' => ']', '(' => ')', '{' => '}')
CLOSE_TO_OPEN = Dict(']' => '[', ')' => '(', '}' => '{')

function matching_brackets(input)
    opened = []

    for c in input
        if haskey(OPEN_TO_CLOSE, c)
            push!(opened, c)
        elseif haskey(CLOSE_TO_OPEN, c)
            if isempty(opened) || pop!(opened) != CLOSE_TO_OPEN[c]
                return false
            end
        end
    end

    isempty(opened)
end
