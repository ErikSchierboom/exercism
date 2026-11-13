# FFT

Welcome to FFT on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

### Fourier Transform

The [Fourier Transform](https://en.wikipedia.org/wiki/Fourier_transform) is seen often in physics and mathematics, which translates to it having many everyday uses as well.

In short, the Fourier Transform takes an input signal, often in time or space domains, and transforms it to the frequency domain.
And more concretely, with an input signal that is made of a jumble (i.e. superposition) of different frequencies, the transform will separate out the individual frequencies and show their relative strengths.

This makes the transform a principal tool in signal processing (e.g. filtering, compression, etc.) and many data science applications.
Therefore, it's perhaps more widely used than one might first imagine, which also makes it a prime example of where imaginary numbers make themselves *indispensable*, considering the output of the Fourier Transform is a complex number in general.

While the Fourier Transform has an integral formulation, we are digital, so we're interested in the discrete version.
The derivation of the transform is beyond the scope of this exercise, but the forward [discrete transform](https://en.wikipedia.org/wiki/Discrete_Fourier_transform) (to the frequency domain)takes the following form:
`Xₖ = Σ xₙ * ℯ^(-2iπk * n/N)`
Here, the sum runs over `n`, and `N` is the number of samples, `k` is the frequency, `i` the imaginary unit and `xₙ` is an individual sample.

### Fast Fourier Transform

While extremely useful, the Fourier Transform, naively implemented, is a bit slow (`O(n²)`).
The [Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) (FFT) is an algorithm which drastically speeds this up.
This is typically done through a divide-and-conquer strategy which exploits some symmetries in the formulation and results in an asymptotically `O(Nlog(N))` complexity.
This speed up greatly improves the practically and range of applications suitable for the transform.

## Instructions

Your friend is a sound engineer who has asked you to help them code up a Fourier Transform for some proprietary software they are putting together.
Since you want to get this right, you will first implement the Discrete Fourier Transform (DFT) in all its naive glory.
This could then be used to test the correctness of your final objective, the Fast Fourier Transform (FFT).

## 1. DFT

Implement the DFT.

Note, that this is of `O(n²)` complexity because you get one `k` for a run through all `n`, and you'll want a `Xₖ` vector that is the same length as the signal `Xₙ` vector (for invertibility), so `n` times through `n` points is `O(n²)`.

## 2. FFT

Implement the FFT.

~~~~exercism/note
There are a lot of resources to find more detail on the particulars of this algorithm, so feel free to do some research.
~~~~