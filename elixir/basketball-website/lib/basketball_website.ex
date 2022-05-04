defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    Enum.reduce(String.split(path, "."), data, &(&2[&1]))
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
