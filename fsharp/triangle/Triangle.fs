module Triangle

let private isValid triangle =
    let [x; y; z] = triangle    
    x > 0. && y > 0. && z > 0. &&
    x + y >= z && x + z >= y && y + z >= x

let private distinctSides triangle = triangle |> List.distinct |> List.length

let equilateral triangle = isValid triangle && distinctSides triangle = 1

let isosceles triangle = isValid triangle && distinctSides triangle <= 2

let scalene triangle = isValid triangle && distinctSides triangle = 3