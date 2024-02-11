DROPS = ((3, "Pling"), (5, "Plang"), (7, "Plong"))

function raindrops(number)
    sounds = join(sound for (factor, sound) in DROPS if number % factor == 0)
    isempty(sounds) ? string(number) : sounds
end
