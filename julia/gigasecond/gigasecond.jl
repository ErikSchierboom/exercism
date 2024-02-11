import Dates: Second

add_gigasecond(date::DateTime) = date + Second(1e9)
