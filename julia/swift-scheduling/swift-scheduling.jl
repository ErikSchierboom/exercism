using Dates

function delivery_date(start, description)
    date = DateTime(start)

    if description == "NOW"
        string(date + Hour(2))
    elseif description == "ASAP"
        if hour(date) < 13
            string(trunc(date, Dates.Day) + Hour(17))
        else
            string(trunc(date, Dates.Day) + Day(1) + Hour(13))
        end
    elseif description == "EOW"
        if dayofweek(date) ∈ [Monday, Tuesday, Wednesday]
            string(trunc(tonext(date, Friday), Dates.Day) + Hour(17))
        else
            string(trunc(tonext(date, Sunday), Dates.Day) + Hour(20))
        end
    elseif description[end] == 'M'
        target_month = Base.parse(Int, description[begin:(end-1)]) - 1
        if month(date) <= target_month
            date = firstdayofmonth(trunc(date, Dates.Year) + Month(target_month))
        else
            date = firstdayofmonth(trunc(date, Dates.Year) + Year(1) + Month(target_month))
        end

        if dayofweek(date) ∈ [Saturday, Sunday]
            date = tonext(date, Monday)
        end

        string(trunc(date, Dates.Day) + Hour(8))
    elseif description[begin] == 'Q'
        target_quarter = Base.parse(Int, description[end])
        if quarterofyear(date) <= target_quarter
            date = lastdayofquarter(trunc(date, Dates.Year) + Quarter(target_quarter - 1))
        else
            date = lastdayofquarter(trunc(date, Dates.Year) + Year(1) + Quarter(target_quarter - 1))
        end

        if dayofweek(date) ∈ [Saturday, Sunday]
            date = toprev(date, Friday)
        end

        string(trunc(date, Dates.Day) + Hour(8))
    end
end
