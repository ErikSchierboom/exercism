module Forth

open System

type Value = int
type Word = string

type Item = 
    | Value of Value
    | Word of Word

type Operation = 
    | Plus 
    | Minus 
    | Mult 
    | Div 
    | Dup 
    | Drop 
    | Swap 
    | Over 
    | User of Item list

type ForthState = { sStack: Value list; sInput: Item list; sMapping: Map<Word, Operation> }

type ForthError = 
    | DivisionByZero 
    | StackUnderflow 
    | InvalidWord 
    | UnknownWord of Word

let defaultMapping = 
    [("+",    Plus);
     ("-",    Minus);
     ("*",    Mult);
     ("/",    Div);
     ("dup",  Dup);
     ("drop", Drop);
     ("swap", Swap);
     ("over", Over)]
    |> Map.ofList

let empty = { sStack = []; sInput = []; sMapping = defaultMapping }

let formatStack (state: ForthState) = 
    state.sStack
    |> List.rev
    |> List.map string
    |> List.reduce (fun x y -> x + " " + y)
    
let parseItem text = 
    match Int32.TryParse text with
    | true, value -> Value value
    | _ -> Word text

let parseText (text: string) = 
    //let isSeparator c = Char.IsWhiteSpace c || Char.IsControl c
    let notEmpty s = not (String.IsNullOrWhiteSpace s)
    text.Split()
    |> Array.filter notEmpty
    |> Array.map parseItem
    |> Array.toList

let addItems state items = { state with sInput = items @ state.sInput }

let parse text state = parseText text |> addItems state

let eval text state = Choice1Of2 state
//
//eval :: Text -> ForthState -> Either ForthError ForthState
//eval text state = eval $ Right $ parse text state
//
//eval :: Either ForthError ForthState -> Either ForthError ForthState
//eval (Left e) = Left e
//eval (Right (S stack [] word)) = Right (S stack [] word)
//eval (Right (S stack (V value:xs) mapping)) = eval $ Right (S (value:stack) xs mapping)
//eval (Right (S stack (W word:xs) mapping)) = 
//  case word of 
//    ":" -> case break (\c -> c == W ";") xs of
//      ((W userWord:operations), remainder) -> eval $ Right (S stack (tail remainder) (M.insert (T.toLower userWord) (User operations) mapping))
//      _ -> Left InvalidWord      
//    ";" -> Left InvalidWord
//    _   -> eval $ evalWord word (S stack xs mapping)
//
//evalWord :: Word -> ForthState -> Either ForthError ForthState
//evalWord word state = 
//  case M.lookup (T.toLower word) (sMapping state) of
//    Nothing -> Left (UnknownWord word)
//    Just op -> applyOp op state
//
//applyOp :: Operation -> ForthState -> Either ForthError ForthState
//applyOp Plus  state = binaryStackOp (toBinaryStackOp (+)) state
//applyOp Minus state = binaryStackOp (toBinaryStackOp (-)) state
//applyOp Mult  state = binaryStackOp (toBinaryStackOp (*)) state
//applyOp Div   state = divOp state
//applyOp Dup   state = unaryStackOp (replicate 2) state
//applyOp Drop  state = unaryStackOp (\_ -> []) state
//applyOp Swap  state = binaryStackOp (\x y -> [y,x]) state
//applyOp Over  state = binaryStackOp (\x y -> [y,x,y]) state
//applyOp (User terms) state = Right $ addItems state terms
//
//toBinaryStackOp :: (Value -> Value -> Value) -> Value -> Value -> [Value]
//toBinaryStackOp op x y = [op y x]
//
//unaryStackOp :: (Value -> [Value]) -> ForthState -> Either ForthError ForthState
//unaryStackOp op state@(S stack _ _) =
//  case stack of 
//    []   -> Left StackUnderflow
//    x:xs -> Right $ state { sStack = op x ++ xs }
//
//binaryStackOp :: (Value -> Value -> [Value]) -> ForthState -> Either ForthError ForthState
//binaryStackOp op state@(S stack _ _) =
//  case stack of 
//    x:y:xs -> Right $ state { sStack = op x y ++ xs }
//    _      -> Left StackUnderflow
//
//divOp :: ForthState -> Either ForthError ForthState
//divOp state@(S stack _ _) = 
//  case stack of 
//    0:_    -> Left DivisionByZero
//    x:y:xs -> Right $ state { sStack = y `div` x:xs }
//    _      -> Left StackUnderflow
//

//


