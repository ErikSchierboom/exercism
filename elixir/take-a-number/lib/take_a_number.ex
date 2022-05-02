defmodule TakeANumber do
  def start(), do: spawn(fn -> loop(0) end)

  defp loop(last_ticket_number) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, last_ticket_number)
        loop(last_ticket_number)

      {:take_a_number, sender_pid} ->
        send(sender_pid, last_ticket_number + 1)
        loop(last_ticket_number + 1)

      :stop ->
        nil

      _ ->
        loop(last_ticket_number)
    end
  end
end
