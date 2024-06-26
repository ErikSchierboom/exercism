module WordSearch

let directions =
    [( 1,  0);
     ( 0,  1);
     (-1,  0);
     ( 0, -1);
     ( 1,  1);
     ( 1, -1);
     (-1,  1);
     (-1, -1)]
     
let update (x, y) (dx, dy) = x + dx, y + dy

let find (puzzle: string) (word: string) =
    let chars = puzzle.Split('\n')

    let width = chars.[0].Length
    let height = chars.Length

    let findChar (x, y) = 
        if x > 0 && x <= width && y > 0 && y <= height then 
            Some chars.[y - 1].[x - 1]
        else 
            None
        
    let findWord (start, direction) =
        let rec helper coord last (remainder: string) =
            if remainder.Length = 0 then 
                Some (start, last)
            elif Some remainder.[0] = findChar coord then 
                helper (update coord direction) coord remainder.[1..]
            else 
                None

        helper start start word

    let permutations = 
        seq { for x in 1 .. width do
                for y in 1 .. height do
                    for dir in directions do
                        yield ((x, y), dir) }
    
    Seq.tryPick findWord permutations