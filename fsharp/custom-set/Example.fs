module CustomSet

type Set<'T> = { items: 'T list }

let empty = { items = [] }

let isEmpty set = set.items.IsEmpty

let size set = set.items.Length 

let fromList list = { items = list |> List.sort |> List.distinct } 

let toList set = set.items

let contains value set = List.contains value set

let insert value set = value::set.items |> fromList  

let delete value set = List.except [value] set.items

let union left right = left.items @ right.items |> fromList

let intersection left right = left |> List.filter (fun x -> List.contains x right)

let difference left right = left |> List.filter (fun x -> List.contains x right |> not)

let isSubsetOf left right = left |> List.forall (fun x -> List.contains x right)

let isDisjointFrom left right = left |> List.exists (fun x -> List.contains x right) |> not