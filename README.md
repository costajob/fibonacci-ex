# Fibonacci computator in Elixir
A simple module to perform Fibonacci computation in the [Elixir language](http://elixir-lang.org/).

## Motivation
I am not a great fan of mathematic, but the [sequence of Fibonacci](http://en.wikipedia.org/wiki/Fibonacci_number) is a good work horse to stress computation via recursive logic with any programming language.

## No tail-recursion
This version does not attempt to perform tail-recursion, which indeed is optimized by some (BEAM) virtual machines (for an elegant solution [look here](https://searchcode.com/codesearch/view/2719356/)).
Instead it relies on multiprocessing and memoization by using the Agent and Task abstractions in the Elixir base library.

## Cache VS Uncache
The experiment prove that computation without cache will struggle when reaching the number of 30 (MacBook Pro i7 2.2Ghz 8GB).
Memoized version is a blaze, but trades speed for memory consumption.

## API
The use of the library is pretty straightforward:

    1..10 |> Enum.map &Fibonacci.of/1

For the cached version remember to initialize the Agent:

    Fibonacci.cache_start
    Fibonacci.of 10000
