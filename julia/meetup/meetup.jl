using Dates

function meetup(year, month, week, dayofweek)
    weekdays = weekdaysinmonth(year, month, dayofweek)
    if week == "first"
        weekdays[1]
    elseif week == "second"
        weekdays[2]
    elseif week == "third"
        weekdays[3]
    elseif week == "fourth"
        weekdays[4]
    elseif week == "last"
        weekdays[end]
    elseif week == "teenth"
        first(filter(weekday -> 13 <= day(weekday) <= 19, weekdays))
    else
        error("Invalid week: $week")
    end
end

const weekdaytoint = Dict(
    "Monday" => Monday,
    "Tuesday" => Tuesday,
    "Wednesday" => Wednesday,
    "Thursday" => Thursday,
    "Friday" => Friday,
    "Saturday" => Saturday,
    "Sunday" => Sunday
)

function weekdaysinmonth(year, month, dayofweek)
    date = tonext(Date(year, month), weekdaytoint[dayofweek]; same=true)

    dates = Date[]
    while Dates.month(date) == month
        push!(dates, date)
        date = tonext(date, weekdaytoint[dayofweek]; same=false)
    end
    dates
end
