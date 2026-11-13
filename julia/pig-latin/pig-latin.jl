const VowelPattern = r"(?<begin>^|\s+)(?<vowel>[aeiou]|xr|yt)(?<rest>\w+)";
const ConsonantPattern = r"(?<begin>^|\s+)(?<consonant>([^aeiou]?qu|[^aeiou]+))(?<rest>[aeiouy]\w*)";

const VowelReplacement = s"\g<begin>\g<vowel>\g<rest>ay";
const ConsonantReplacement = s"\g<begin>\g<rest>\g<consonant>ay";

function translate(phrase::AbstractString)
    join((translate(word) for word in split(phrase)), " ")
end

function translate(word::SubString{String})
    occursin(VowelPattern, word) ? replace(word, VowelPattern => VowelReplacement) : replace(word, ConsonantPattern => ConsonantReplacement)
end
