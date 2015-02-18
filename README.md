# Fibonacci computation in Elixir
A simple module to perform Fibonacci computation in the Elixir language

# Motivation
I am not a big fan of mathematic, but the Fibonacci sequence is a good work horse
to prove computation and recursion in programming language.
In particular concept as memoization and parallelism can be stressed out by the
standard algorithm.

# Head-tail recursion
This version does not attempt to perform head-tail recursion, which indeed is
optimized by some (BEAM) virtual machines.
Instead it relies on multiprocessing and memoization by using the Agent and Task
abstractions in the Elixir base library.

# Cache VS Uncache
The experiment prove that computation without cache will struggle when reaching the
number of 30 (MacBook Pro i7 2.2Ghz 8GB). Memoized version is a blaze. More
interesting is that the BEAM keeps memory consumption under control also with large
values (> 100000).
