~ "forth.ua" ~ Evaluate

# Parsing and numbers - numbers just get pushed onto the stack
⍤⤙≍ [1 2 3 4 5] Evaluate "1 2 3 4 5"

# Parsing and numbers - pushes negative numbers onto the stack
⍤⤙≍ [¯1 ¯2 ¯3 ¯4 ¯5] Evaluate "-1 -2 -3 -4 -5"

# Addition - can add two numbers
⍤⤙≍ [3] Evaluate "1 2 +"

# Addition - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "+")

# Addition - errors if there is only one value on the stack
⍤⤙≍ "only one value on the stack" ⍣(Evaluate "1 +")

# Subtraction - can subtract two numbers
⍤⤙≍ [¯1] Evaluate "3 4 -"

# Subtraction - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "-")

# Subtraction - errors if there is only one value on the stack
⍤⤙≍ "only one value on the stack" ⍣(Evaluate "1 -")

# Multiplication - can multiply two numbers
⍤⤙≍ [8] Evaluate "2 4 *"

# Multiplication - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "*")

# Multiplication - errors if there is only one value on the stack
⍤⤙≍ "only one value on the stack" ⍣(Evaluate "1 *")

# Division - can divide two numbers
⍤⤙≍ [4] Evaluate "12 3 /"

# Division - performs integer division
⍤⤙≍ [2] Evaluate "8 3 /"

# Division - errors if dividing by zero
⍤⤙≍ "divide by zero" ⍣(Evaluate "4 0 /")

# Division - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "/")

# Division - errors if there is only one value on the stack
⍤⤙≍ "only one value on the stack" ⍣(Evaluate "1 /")

# Combined arithmetic - addition and subtraction
⍤⤙≍ [¯1] Evaluate "1 2 + 4 -"

# Combined arithmetic - multiplication and division
⍤⤙≍ [2] Evaluate "2 4 * 3 /"

# Dup - copies a value on the stack
⍤⤙≍ [1 1] Evaluate "1 dup"

# Dup - copies the top value on the stack
⍤⤙≍ [1 2 2] Evaluate "1 2 dup"

# Dup - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "dup")

# Drop - removes the top value on the stack if it is the only one
⍤⤙≍ [] Evaluate "1 drop"

# Drop - removes the top value on the stack if it is not the only one
⍤⤙≍ [1] Evaluate "1 2 drop"

# Drop - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "drop")

# Swap - swaps the top two values on the stack if they are the only ones
⍤⤙≍ [2 1] Evaluate "1 2 swap"

# Swap - swaps the top two values on the stack if they are not the only ones
⍤⤙≍ [1 3 2] Evaluate "1 2 3 swap"

# Swap - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "swap")

# Swap - errors if there is only one value on the stack
⍤⤙≍ "only one value on the stack" ⍣(Evaluate "1 swap")

# Over - copies the second element if there are only two
⍤⤙≍ [1 2 1] Evaluate "1 2 over"

# Over - copies the second element if there are more than two
⍤⤙≍ [1 2 3 2] Evaluate "1 2 3 over"

# Over - errors if there is nothing on the stack
⍤⤙≍ "empty stack" ⍣(Evaluate "over")

# Over - errors if there is only one value on the stack
⍤⤙≍ "only one value on the stack" ⍣(Evaluate "1 over")

# Case-insensitivity - DUP is case-insensitive
⍤⤙≍ [1 1 1 1] Evaluate "1 DUP Dup dup"

# Case-insensitivity - DROP is case-insensitive
⍤⤙≍ [1] Evaluate "1 2 3 4 DROP Drop drop"

# Case-insensitivity - SWAP is case-insensitive
⍤⤙≍ [2 3 4 1] Evaluate "1 2 SWAP 3 Swap 4 swap"

# Case-insensitivity - OVER is case-insensitive
⍤⤙≍ [1 2 1 2 1] Evaluate "1 2 OVER Over over"
