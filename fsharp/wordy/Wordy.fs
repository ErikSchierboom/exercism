module Wordy

open FParsec

let private parseToOption parser (input: string) =
    match run parser input with
    | Success(result, _, _) -> Some result
    | Failure _ -> None

let private parseExpression = 
    let opp = OperatorPrecedenceParser<int,unit,unit>()
    opp.TermParser <- pint32 .>> spaces

    opp.AddOperator(InfixOperator("plus",          spaces, 1, Associativity.Left, (+)))
    opp.AddOperator(InfixOperator("minus",         spaces, 1, Associativity.Left, (-)))
    opp.AddOperator(InfixOperator("multiplied by", spaces, 1, Associativity.Left, (*)))
    opp.AddOperator(InfixOperator("divided by",    spaces, 1, Associativity.Left, (/)))

    opp.ExpressionParser

let private parseEquation = pstring "What is " >>. parseExpression .>>  pstring "?"

let answer question = parseToOption parseEquation question