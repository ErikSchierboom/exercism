defmodule BankAccount do
  def open_bank() do
    {:ok, account} = Agent.start(fn -> {:open, 0} end)
    account
  end

  def close_bank(account) do
    Agent.update(account, fn _ -> {:error, :account_closed} end)
  end

  def balance(account) do
    Agent.get(account, fn
      {:open, balance} -> balance
      {:error, error} -> {:error, error}
    end)
  end

  def update(account, amount) do
    Agent.get_and_update(account, fn
      {:open, balance} -> {{:open, balance + amount}, {:open, balance + amount}}
      {:error, error} -> {{:error, error}, {:error, error}}
    end)
  end
end
