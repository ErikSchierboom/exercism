module Meetup

type Week = First | Second | Third | Fourth | Last | Teenth

let meetup year month week dayOfWeek = 
    let daysOfWeek = 
        [1 .. System.DateTime.DaysInMonth(year, month)]
        |> Seq.map (fun day -> System.DateTime(year, month, day))
        |> Seq.filter (fun date -> date.DayOfWeek = dayOfWeek)
               
    match week with
    | Week.First  -> daysOfWeek |> Seq.item 0
    | Week.Second -> daysOfWeek |> Seq.item 1
    | Week.Third  -> daysOfWeek |> Seq.item 2
    | Week.Fourth -> daysOfWeek |> Seq.item 3
    | Week.Last   -> daysOfWeek |> Seq.last 
    | Week.Teenth -> daysOfWeek |> Seq.find (fun date -> date.Day >= 13)
