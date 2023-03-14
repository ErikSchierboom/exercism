function generate_card(entry)
    m = match(r"^»(?<title>.+?)« – (?<name>.+?)(?: \((?<first_pronoun>.+?)\/(?<second_pronoun>.+?)\))?(?:, from (?<org>.+?))?\. Start: (?<start>\d{2}:\d{2})(?:, Q&A: (?<qa>\d{2}:\d{2}))?, End: (?<stop>\d{2}:\d{2})", entry)

    title = m["title"]
    name = m["name"]
    org = isnothing(m["org"]) ? "" : ", from $(m["org"])"
    second_pronoun = isnothing(m["second_pronoun"]) ? first(split(name)) * "'s" : titlecase(replace(replace(m["second_pronoun"], "them" => "their"), "him" => "his"))
    first_pronoun = isnothing(m["first_pronoun"]) ? first(split(name)) : titlecase(m["first_pronoun"])
    qa = m["qa"]
    start = m["start"]
    stop = m["stop"]

    if isnothing(qa)
        """
        - Our next speaker is $name$org
        - $second_pronoun talk is called »$title«
        - There will not be a Q&A session

        $start - NO Q&A - $stop
        """
    else
        """
        - Our next speaker is $name$org
        - $second_pronoun talk is called »$title«
        - $first_pronoun will answer your questions in the Q&A session at the end of the talk, starting at $qa

        $start - $qa - $stop
        """
    end
end
