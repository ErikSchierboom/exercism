defmodule ETL do
  def transform(input) do
    for {score, letters} <- input,
         letter <- letters, into: %{} do
      {String.downcase(letter), score}
    end
  end
end
