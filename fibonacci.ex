defmodule Fibonacci do
  @cache_name __MODULE__

  def of(0), do: 0
  def of(1), do: 1
  def of(n) do
    if cache_active? do
      compute_with_cache(n)
    else
      compute_async(n)
    end
  end

  def cache_start do
    Agent.start_link(&HashDict.new/0, name: @cache_name)
  end

  defp cache_set(n, result) do
    Agent.get_and_update(@cache_name, fn(cache) ->
      {result, Dict.put(cache, n, result)}
    end)
  end

  defp cache_get(n) do
    Agent.get(@cache_name, fn(cache) -> Dict.get(cache, n, :uncached) end)
  end

  defp cache_active? do
    Process.whereis(@cache_name)
  end

  defp compute_with_cache(n) do
    case result = cache_get(n)  do
      :uncached ->
        result = compute_async(n)
        cache_set(n, result)        
      _ ->
        result
    end
  end

  defp compute_async(n) do
    try do
      worker = Task.async(fn ->
        of(n - 1) + of(n - 2)
      end)
      Task.await(worker)
    catch
      :exit, _ -> :takes_too_long_to_compute
    end
  end
end
