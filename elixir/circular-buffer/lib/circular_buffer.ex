defmodule CircularBuffer do
  def new(capacity) do
    Agent.start(fn -> {capacity, []} end)
  end

  def read(buffer) do
    Agent.get_and_update(buffer, fn
      {capacity, [item | items]} -> {{:ok, item}, {capacity, items}}
      {capacity, []} -> {{:error, :empty}, {capacity, []}}
    end)
  end

  def write(buffer, item) do
    Agent.get_and_update(buffer, fn {capacity, items} ->
      if Enum.count(items) < capacity do
        {:ok, {capacity, items ++ [item]}}
      else
        {{:error, :full}, {capacity, items}}
      end
    end)
  end

  def overwrite(buffer, item) do
    Agent.get_and_update(buffer, fn {capacity, items} ->
      if Enum.count(items) < capacity do
        {:ok, {capacity, items ++ [item]}}
      else
        [_ | tail] = items
        {:ok, {capacity, tail ++ [item]}}
      end
    end)
  end

  def clear(buffer) do
    Agent.update(buffer, fn {capacity, _} -> {capacity, []} end)
  end
end
