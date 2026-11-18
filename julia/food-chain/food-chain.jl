const Animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
const Phrases = [
    ""
    "It wriggled and jiggled and tickled inside her."
    "How absurd to swallow a bird!"
    "Imagine that, to swallow a cat!"
    "What a hog, to swallow a dog!"
    "Just opened her throat and swallowed a goat!"
    "I don't know how she swallowed a cow!"
]

verse_begin(n) = "I know an old lady who swallowed a $(Animals[n])."

function verse_middle(n)
    if n == 8
        return []
    end

    middle = String[]

    if n > 1
        push!(middle, Phrases[n])
    end

    for i in n:-1:2
        swallowed = Animals[i]
        caught = Animals[i-1]
        if caught == "spider"
            caught = "spider that wriggled and jiggled and tickled inside her"
        end

        push!(middle, "She swallowed the $swallowed to catch the $caught.")
    end

    middle
end

function verse_end(n)
    if n == 8
        return "She's dead, of course!"
    end

    "I don't know why she swallowed the fly. Perhaps she'll die."
end

verse(n) = [verse_begin(n), verse_middle(n)..., verse_end(n)]

function recite(start_verse, end_verse)
    lines = String[]

    for n in start_verse:end_verse
        append!(lines, verse(n))

        if n < end_verse
            push!(lines, "")
        end
    end

    lines
end
