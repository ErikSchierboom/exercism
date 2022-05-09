# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{registrations: %{}, next_plot_id: 0} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, &Map.values(&1.registrations))
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      plot = %Plot{plot_id: state.next_plot_id, registered_to: register_to}

      new_state = %{
        state
        | registrations: Map.put(state.registrations, plot.plot_id, plot),
          next_plot_id: state.next_plot_id + 1
      }

      {plot, new_state}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      %{state | registrations: Map.delete(state.registrations, plot_id)}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      Map.get(state.registrations, plot_id, {:not_found, "plot is unregistered"})
    end)
  end
end
