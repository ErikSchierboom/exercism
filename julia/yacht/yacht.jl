function score(dice, category)
    if category == "ones"
        sum(filter(==(1), dice))
    elseif category == "twos"
        sum(filter(==(2), dice))
    elseif category == "threes"
        sum(filter(==(3), dice))
    elseif category == "fours"
        sum(filter(==(4), dice))
    elseif category == "fives"
        sum(filter(==(5), dice))
    elseif category == "sixes"
        sum(filter(==(6), dice))
    elseif category == "full house"
        sorted = sort(dice)
        allequal(sorted) && return 0
        allequal(sorted[1:3]) && allequal(sorted[4:5]) && return sum(dice)
        allequal(sorted[1:2]) && allequal(sorted[3:5]) && return sum(dice)
        0
    elseif category == "four of a kind"
        sorted = sort(dice)
        allequal(sorted[1:4]) && return sum(sorted[1:4])
        allequal(sorted[2:5]) && return sum(sorted[2:5])
        0
    elseif category == "little straight"
        sort(dice) == 1:5 ? 30 : 0
    elseif category == "big straight"
        sort(dice) == 2:6 ? 30 : 0
    elseif category == "choice"
        sum(dice)
    elseif category == "yacht"
        allequal(dice) ? 50 : 0
    else
        0
    end
end
