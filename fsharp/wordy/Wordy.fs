module WordProblem

open FParsec

let parseToOption parser (input: string) =
    match run parser input with
    | Success(result, _, _)   -> Some result
    | Failure(errorMsg, _, _) -> None

let parseExpression = 
    let opp = new OperatorPrecedenceParser<int,unit,unit>()
    opp.TermParser <- pint32 .>> spaces

    opp.AddOperator(InfixOperator("plus",          spaces, 1, Associativity.Left, (+)))
    opp.AddOperator(InfixOperator("minus",         spaces, 1, Associativity.Left, (-)))
    opp.AddOperator(InfixOperator("multiplied by", spaces, 1, Associativity.Left, (*)))
    opp.AddOperator(InfixOperator("divided by",    spaces, 1, Associativity.Left, (/)))

    opp.ExpressionParser

let parseEquation = pstring "What is " >>. parseExpression .>>  pstring "?"

let solve (question: string) = parseToOption parseEquation question