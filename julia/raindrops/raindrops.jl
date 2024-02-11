DROPS = ((3, "Pling"), (5, "Plang"), (7, "Plong"))

function raindrops(number)
    sounds = [sound for (factor, sound) in DROPS if number % factor == 0]
    isempty(sounds) ? string(number) : join(sounds)
end
