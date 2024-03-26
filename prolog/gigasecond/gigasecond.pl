add_gigasecond(Date, GigasecondDate) :-
    date_time_stamp(Date, TimeStamp),
    date_time_value(time_zone, Date, TZ),
    GigasecondTimeStamp is TimeStamp + 1000000000,
    stamp_date_time(GigasecondTimeStamp, GigasecondDate, TZ).
