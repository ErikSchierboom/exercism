module Sublist

type SublistType = Equal | Sublist | Superlist | Unequal

let private isSublist (list1: List<'T>) (list2: List<'T>) =
    list1.IsEmpty || List.windowed list1.Length list2 |> List.exists (fun window -> window = list1)

let sublist (list1: List<'T>) (list2: List<'T>) =
    if list1.Length < list2.Length then
        if isSublist list1 list2 then Sublist else Unequal
    elif list1.Length > list2.Length then
        if isSublist list2 list1 then Superlist else Unequal
    else
        if list1 = list2 then Equal else Unequal
