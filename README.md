# Fibonacci computator in Elixir
A simple module to perform Fibonacci computation in the [Elixir language](http://elixir-lang.org/).

# Motivation
I am not a great fan of mathematic, but the [sequence of Fibonacci](http://en.wikipedia.org/wiki/Fibonacci_number) is a good work horse to stress computation via recursive logic with any programming language.

# No tail-recursion
This version does not attempt to perform tail-recursion, which indeed is optimized by some (BEAM) virtual machines (for an elegant solution [look here](https://gist.github.com/jbowles/8a2d8d177a6ed242e334)).
Instead it relies on multiprocessing and memoization by using the Agent and Task abstractions in the Elixir base library.

# Cache VS Uncache
The experiment prove that computation without cache will struggle when reaching the number of 30 (MacBook Pro i7 2.2Ghz 8GB).
Memoized version is a blaze. More interesting is that the BEAM keeps memory consumption under control also with large numbers (> 100000).
