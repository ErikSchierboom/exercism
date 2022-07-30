defmodule BinarySearchTree do
  def new(data), do: %{data: data, left: nil, right: nil}

  def insert(nil, data), do: new(data)

  def insert(tree, data) do
    cond do
      data <= tree.data -> %{tree | left: insert(tree.left, data)}
      true -> %{tree | right: insert(tree.right, data)}
    end
  end

  def in_order(nil), do: []

  def in_order(tree) do
    in_order(tree.left) ++ [tree.data] ++ in_order(tree.right)
  end
end
