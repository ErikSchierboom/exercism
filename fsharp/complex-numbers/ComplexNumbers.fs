module ComplexNumbers

open System

type ComplexNumber = { real: float; imaginary: float }

let create real imaginary = { real = real; imaginary = imaginary }

let mul z1 z2 = create (z1.real * z2.real - z1.imaginary * z2.imaginary) (z1.imaginary * z2.real + z1.real * z2.imaginary)

let add z1 z2 = create (z1.real + z2.real) (z1.imaginary + z2.imaginary)

let sub z1 z2 = { real = z1.real - z2.real; imaginary = z1.imaginary - z2.imaginary }

let div z1 z2 = 
    let denominator = z2.real * z2.real + z2.imaginary * z2.imaginary
    let real = (z1.real * z2.real + z1.imaginary * z2.imaginary) / denominator
    let imaginary = (z1.imaginary * z2.real - z1.real * z2.imaginary) / denominator
    create real imaginary

let abs z = Math.Sqrt(z.real * z.real + z.imaginary * z.imaginary)

let conjugate z = create z.real -z.imaginary

let real z = z.real

let imaginary z = z.imaginary

let exp z = create (Math.Exp(z.real) * Math.Cos(z.imaginary)) (Math.Exp(z.real) * Math.Sin(z.imaginary))