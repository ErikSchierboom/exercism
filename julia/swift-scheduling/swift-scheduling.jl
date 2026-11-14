using Dates

const datefmt = dateformat"yyyy-mm-dd\THH:MM:SS"

parse(start) = DateTime(start, datefmt)
format(date) = Dates.format(date, datefmt)

function delivery_date(start, description)
    date = parse(start)

    if description == "NOW"
        format(date + Hour(2))
    elseif description == "ASAP"
        if hour(date) < 13
            format(trunc(DateTime(date), Dates.Day) + Hour(17))
        else
            format(trunc(DateTime(date), Dates.Day) + Day(1) + Hour(13))
        end
    elseif description == "EOW"
        if dayofweek(date) ∈ [Monday, Tuesday, Wednesday]
            format(trunc(tonext(date, Friday), Dates.Day) + Hour(17))
        else
            format(trunc(tonext(date, Sunday), Dates.Day) + Hour(20))
        end
    elseif description[end] == 'M'
        target_month = Base.parse(Int, description[begin:(end-1)])
        if month(date) < target_month
            date = Dates.firstdayofmonth(trunc(date, Dates.Year) + Month(target_month - 1))
        else
            date = Dates.firstdayofmonth(trunc(date, Dates.Year) + Year(1) + Month(target_month - 1))
        end

        if dayofweek(date) ∈ [Saturday, Sunday]
            date = tonext(date, Monday)
        end

        format(trunc(date, Dates.Day) + Hour(8))
    elseif description[begin] == 'Q'
        target_quarter = Base.parse(Int, description[end])
        if quarterofyear(date) <= target_quarter
            date = Dates.lastdayofquarter(trunc(date, Dates.Year) + Quarter(target_quarter - 1))
        else
            date = Dates.lastdayofquarter(trunc(date, Dates.Year) + Year(1) + Quarter(target_quarter - 1))
        end

        if dayofweek(date) ∈ [Saturday, Sunday]
            date = toprev(date, Friday)
        end

        format(trunc(date, Dates.Day) + Hour(8))
    end
end
