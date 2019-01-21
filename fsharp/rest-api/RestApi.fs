module RestApi

open Newtonsoft.Json
open Newtonsoft.Json.Serialization
open System.Collections.Generic

let snakeCaseContractResolver = DefaultContractResolver()
snakeCaseContractResolver.NamingStrategy <- new SnakeCaseNamingStrategy()

let serializerSettings = JsonSerializerSettings()
serializerSettings.ContractResolver <- snakeCaseContractResolver

let deserialize<'T> (payload: string) = JsonConvert.DeserializeObject<'T>(payload, serializerSettings)
let serialize obj = JsonConvert.SerializeObject(obj, serializerSettings)

type AddUserPayload = { User: string }

type GetUsersPayload = { Users: string[] }

type IOUPayload = {
    Lender: string;
    Borrower: string;
    Amount: decimal
}
 
type User = {
    Name: string
    Owes: SortedDictionary<string, decimal>
    OwedBy: SortedDictionary<string, decimal> } with

    member this.Balance with get () = Seq.sum this.OwedBy.Values - Seq.sum this.Owes.Values

    member this.BorrowFrom(lender: string, amount: decimal) =
        this.UpdateDebt(lender, amount)
        
    member this.LendTo(borrower: string, amount: decimal) =
        this.UpdateDebt(borrower, -amount)
        
    member this.UpdateDebt(user: string, amount: decimal) =
        let newDebt = amount + this.CurrentDebt(user)
        if newDebt = 0.0m then
            this.Owes.Remove(user) |> ignore
            this.OwedBy.Remove(user) |> ignore
        elif newDebt > 0.0m then
            this.Owes.[user] <- newDebt
            this.OwedBy.Remove(user) |> ignore
        else
            this.OwedBy.[user] <- -newDebt
            this.Owes.Remove(user) |> ignore
        
    member this.CurrentDebt(lender: string) =
         this.Owes.GetValueOrDefault(lender) - this.OwedBy.GetValueOrDefault(lender)
    
type Database = { Users: List<User> } with

    member this.Filter(userNames: string seq): Database =
        { this with Users = List(this.Users |> Seq.filter (fun user -> Seq.contains user.Name userNames)) }
    
    member this.AddUser(name: string): User =
        let user = { Name = name; Owes = SortedDictionary(); OwedBy = SortedDictionary() }
        this.Users.Add(user)
        user
        
    member this.ProcessIOU(lender: string, borrower: string, amount: decimal) =
        let lenderUser = this.GetUser(lender)
        let borrowerUser = this.GetUser(borrower)
        lenderUser.LendTo(borrower, amount)
        borrowerUser.BorrowFrom(lender, amount)
            
    member this.GetUser(name: string): User =
        this.Users.Find(fun user -> user.Name = name)

type RestApi(database : string) =
    
    let db = deserialize<Database>(database)

    member this.Get(url: string) =
        match url with
        | "/users" ->
            db |> serialize
        | _ ->
            failwith "404 Not found"
    member this.Get(url: string, payload: string) =
        match url with
        | "/users" ->
            let getUsersPayload = deserialize<GetUsersPayload>(payload)
            db.Filter(getUsersPayload.Users) |> serialize 
        | _ ->
            failwith "404 Not found"
    member this.Post(url: string, payload: string) =
        match url with
        | "/add" ->
            let addUserPayload = deserialize<AddUserPayload>(payload)
            serialize(db.AddUser(addUserPayload.User))
        | "/iou" ->
            let iouPayload = deserialize<IOUPayload>(payload)
            db.ProcessIOU(iouPayload.Lender, iouPayload.Borrower, iouPayload.Amount)
            db.Filter([iouPayload.Lender; iouPayload.Borrower]) |> serialize
        | _ ->
            failwith "404 Not found"
