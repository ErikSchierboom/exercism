function transform(ch)
    if ch == '-' return "_" end
    if 'α' <= ch <= 'ω' return "?" end
    if isspace(ch) || isdigit(ch) return "" end
    if isletter(ch) && isuppercase(ch) return "-$(lowercase(ch))" end

    string(ch)
end

clean(str) = join(transform(ch) for ch in str)
