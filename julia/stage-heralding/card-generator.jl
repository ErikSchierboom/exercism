function generate_card(entry)
    m = match(r"^»(?<title>.+?)« – (?<first_name>.+?) (?<surname>.+?)(?: \((?<first_pronoun>.+?)/(?<second_pronoun>.+?)\)?)(?:\, from (?<org>.+?))\. Start: (?<start>\d{2}:\d{2})(?:, Q&A: (?<qa>\d{2}:\d{2}))?, End: (?<stop>\d{2}:\d{2})", entry)

    name = m["first_name"]
    name *= isnothing(m["surname"]) ? "" : " $(m["surname"])"
    org = isnothing(m["org"]) ? "" : ", from $(m["org"])"
    title = m["title"]
    second_addressing = isnothing(m["second_pronoun"]) ? "$(m["first_name"])'s" : titlecase(replace(replace(m["second_pronoun"], "them" => "their"), "him" => "his"))
    first_addressing = isnothing(m["first_pronoun"]) ? m["first_name"] : titlecase(m["first_pronoun"])
    qa = m["qa"]
    start = m["start"]
    stop = m["stop"]

    lines = []
    push!(lines, "- Our next speaker is $name$org\n")
    push!(lines, "- $second_addressing talk is called »$title«\n")

    if isnothing(qa)
        push!(lines, "- There will not be a Q&A session\n")
        push!(lines, "\n")
        push!(lines, "$start - NO Q&A - $stop\n")
    else
        push!(lines, "- $first_addressing will answer your questions in the Q&A session at the end of the talk, starting at $qa\n")
        push!(lines, "\n")
        push!(lines, "$start - $qa - $stop\n")
    end

    join(lines)
end
