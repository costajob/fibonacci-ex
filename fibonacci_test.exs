ExUnit.start
Code.require_file("fibonacci.ex", __DIR__)

defmodule FibonacciTest do
  use ExUnit.Case, async: true 
  
  setup_all do
    sequence = 10..20
    results  = [55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]
    {:ok, sequence: sequence, results: results}
  end
  
  test "compute 0 and 1 values" do
    immutable_seq = [0, 1]
    assert immutable_seq
    |> Enum.map(&Fibonacci.of/1) == immutable_seq
  end

  test "compute the values without cache", context do
    assert context[:sequence]
    |> Enum.map(&Fibonacci.of/1) == context[:results]
  end

  test "cache activation" do
    Fibonacci.cache_start
    assert is_pid Process.whereis Fibonacci
  end

  test "compute the values with cache", context do
    Fibonacci.cache_start
    assert context[:sequence]
    |> Enum.map(&Fibonacci.of/1) == context[:results]
  end
end
