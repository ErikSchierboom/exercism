defmodule Newsletter do
  def read_emails(path) do
    File.read!(path) |> String.split()
  end

  @spec open_log(any) :: nil
  def open_log(path) do
    {:ok, io_device} = File.open(path, [:write])
    io_device
  end

  @spec log_sent_email(any, any) :: nil
  def log_sent_email(pid, email) do
    IO.write(pid, email)
    IO.write(pid, "\n")
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log_file = open_log(log_path)

    for email <- read_emails(emails_path) do
      if send_fun.(email) == :ok do
        log_sent_email(log_file, email)
      end
    end

    close_log(log_file)
  end
end
