using Dates

const scheduledtfmt = dateformat"m/d/y H:M:S"
const describedatefmt = dateformat"E, U d, yyyy"
const describettimefmt = dateformat"HH:MM"

schedule_appointment(appointment::String) = DateTime(appointment, scheduledtfmt)

has_passed(appointment::DateTime) = appointment < now()

is_afternoon_appointment(appointment::DateTime) = 12 <= hour(appointment) < 18

function describe(appointment::DateTime)
    date = Dates.format(appointment, describedatefmt)
    time = Dates.format(appointment, describettimefmt)
    "You have an appointment on $date at $time"
end

anniversary_date() = Date(year(now()), 9, 15)
