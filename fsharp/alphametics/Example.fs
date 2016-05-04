module Alphametics

open FParsec

open System
open System.Text.RegularExpressions

type Operator = Plus | Mult | Pow
    
type Token =
    | Operand of int
    | Operator of Operator

let operators = 
    [(Pow,  fun x y -> pown x y |> Operand); 
     (Mult, fun x y -> x * y |> Operand); 
     (Plus, fun x y -> x + y |> Operand)]

let operand: Parser<Token, unit> = pint32 |>> Operand
let operator: Parser<Token, unit> = 
        (stringReturn "+"  (Operator Plus)) 
    <|> (stringReturn "*"  (Operator Mult))
    <|> (stringReturn "^"  (Operator Pow))

let tokenize (str:string) = 
    
    let operand = pint32 |>> Operand
    let operator = 
            (stringReturn "+"  (Operator Plus)) 
        <|> (stringReturn "*"  (Operator Mult))
        <|> (stringReturn "^"  (Operator Pow))

    let token = operand .>> spaces <|> operator .>> spaces
    let equation = many token .>> (pstring "==") .>> spaces .>>. many token

    run equation str

let rec simplifyOperator (operator, op) acc remainder =     
        match remainder with    
        | Operand x::Operator y::Operand z::xs when y = operator -> simplifyOperator (operator, op) (op x z::acc) xs
        | x::xs -> simplifyOperator (operator, op) (x::acc) xs
        | [] -> acc |> List.rev

let simplify equation = operators |> List.fold (fun acc operator -> simplifyOperator operator [] acc) equation

let solveEquation (left, right) = simplify left = simplify right

let equationIsCorrect input = 
    match tokenize input with    
    | Failure _ -> false
    | Success (equation, _, _) -> solveEquation equation

let chars (str: string) = str |> Seq.filter (Char.IsLetter) |> Set.ofSeq

let generateCombinations length =
    let rec helper remaining options =
        seq { if remaining = 0 then yield [] else
                for x in options do
                    for xs in helper (remaining - 1) (Set.remove x options) do
                        yield x::xs }

    helper length ([0..9] |> Set.ofList)

let generateMaps (str: string) =
    let c = chars str
    let nonZeroChars = Regex.Matches (str, "([A-Z])[A-Z]*") |> Seq.cast<Match> |> Seq.map (fun m -> m.Groups |> Seq.cast<Group> |> Seq.map (fun n -> n.Value.Chars 0) |> Seq.item 1) |> Set.ofSeq
   
    generateCombinations (Set.count c)
    |> Seq.map (Seq.zip c >> Map.ofSeq)
    |> Seq.filter (fun m -> Set.forall (fun x -> Map.find x m <> 0) nonZeroChars)

let trySolve (input: string) map =
    map
    |> Map.fold (fun (acc: string) (key: char) (value: int) -> acc.Replace(string key, string value)) input 
    |> equationIsCorrect

let solve input = 
    generateMaps input
    |> Seq.tryFind (trySolve input)