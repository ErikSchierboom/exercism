module ComplexNumbers

open System

type ComplexNumber = { r: float; i: float }

let real z = z.r

let imaginary z = z.i

let create real imaginary = { r = real; i = imaginary }

let exp z = create (Math.Exp(z.r) * Math.Cos(z.i)) (Math.Exp(z.r) * Math.Sin(z.i))

let abs z = Math.Sqrt(z.r * z.r + z.i * z.i)

let conjugate z = create z.r -z.i

let mul z1 z2 = create (z1.r * z2.r - z1.i * z2.i) (z1.i * z2.r + z1.r * z2.i)

let add z1 z2 = create (z1.r + z2.r) (z1.i + z2.i)

let sub z1 z2 = create (z1.r - z2.r) (z1.i - z2.i)

let div z1 z2 = 
    let numerator = mul z1 (conjugate z2)
    let denominator = mul z2 (conjugate z2)    
    create (numerator.r / denominator.r) (numerator.i / denominator.r)
