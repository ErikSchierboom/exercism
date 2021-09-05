# Parallel Letter Frequency

Welcome to Parallel Letter Frequency on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Count the frequency of letters in texts using parallel computation.

Parallelism is about doing things in parallel that can also be done
sequentially. A common example is counting the frequency of letters.
Create a function that returns the total frequency of each letter in a
list of texts and that employs parallelism.

Your code should contain a frequency :: Int -> [Text] -> Map Char Int
function which accepts a number of workers to use in parallel and a list
of texts and returns the total frequency of each letter in the text.

## Benchmark

Check how changing number of workers affects performance of your solution by running the benchmark. Use `stack bench` to run it. Feel free to modify `bench/Benchmark.hs` to explore your solution's performance on different inputs.

## Source

### Contributed to by

- @iHiD
- @kytrinyx
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane
- @unmanbearpig