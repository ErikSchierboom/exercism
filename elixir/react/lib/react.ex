defmodule React do
  @opaque cells :: pid

  @type cell :: {:input, String.t(), any} | {:output, String.t(), [String.t()], fun()}

  @doc """
  Start a reactive system
  """
  @spec new(cells :: [cell]) :: {:ok, pid}
  def new(cells) do
    Agent.start(fn ->
      Map.new(cells, fn
        {:input, name, value} ->
          {name, {:input, value, %{}}}

        {:output, name, dependencies, calculate} ->
          {name, {:output, dependencies, calculate, %{}}}
      end)
    end)
  end

  @doc """
  Return the value of an input or output cell
  """
  @spec get_value(cells :: pid, cell_name :: String.t()) :: any()
  def get_value(cells, cell_name) do
    Agent.get_and_update(cells, &{do_get_value(&1, cell_name), &1})
  end

  defp do_get_value(state, cell_name) do
    case Map.get(state, cell_name) do
      {:input, value, _} ->
        value

      {:output, dependencies, calculate, _} ->
        apply(calculate, Enum.map(dependencies, &do_get_value(state, &1)))
    end
  end

  @doc """
  Set the value of an input cell
  """
  @spec set_value(cells :: pid, cell_name :: String.t(), value :: any) :: :ok
  def set_value(cells, cell_name, value) do
    Agent.update(
      cells,
      &Map.update(&1, cell_name, {:input, value, %{}}, fn {:input, _, callbacks} ->
        {:input, value, callbacks}
      end)
    )
  end

  @doc """
  Add a callback to an output cell
  """
  @spec add_callback(
          cells :: pid,
          cell_name :: String.t(),
          callback_name :: String.t(),
          callback :: fun()
        ) :: :ok
  def add_callback(cells, cell_name, callback_name, callback) do
    Agent.update(
      cells,
      &Map.update(&1, cell_name, nil, fn {:input, value, callbacks} ->
        {:input, value, Map.put(callbacks, callback_name, callback)}
      end)
    )
  end

  @doc """
  Remove a callback from an output cell
  """
  @spec remove_callback(cells :: pid, cell_name :: String.t(), callback_name :: String.t()) :: :ok
  def remove_callback(cells, cell_name, callback_name) do
    Agent.update(
      cells,
      &Map.update(&1, cell_name, nil, fn {:input, value, callbacks} ->
        {:input, value, Map.delete(callbacks, callback_name)}
      end)
    )
  end
end
