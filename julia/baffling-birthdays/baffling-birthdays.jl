using Dates

function shared_birthday(birthdates)
    !allunique((month(date), day(date)) for date in Date.(birthdates))
end

function random_birthdate()
    year = rand(1901:2:2023)
    Date(year) + Day(rand(0:(daysinyear(year)-1)))
end

function random_birthdates(groupsize)
    [random_birthdate() for _ in 1:groupsize]
end

function estimate_probability_of_shared_birthday(groupsize)
    ITERATIONS = 10000
    count(shared_birthday(random_birthdates(groupsize)) for _ in 1:ITERATIONS) / ITERATIONS
end
