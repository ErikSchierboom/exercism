defmodule Satellite do
  @typedoc """
  A tree, which can be empty, or made from a left branch, a node and a right branch
  """
  @type tree :: {} | {tree, any, tree}

  @doc """
  Build a tree from the elements given in a pre-order and in-order style
  """
  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}

  def build_tree([], []), do: {:ok, {}}

  def build_tree(preorder, inorder) do
    cond do
      Enum.count(preorder) != Enum.count(inorder) ->
        {:error, "traversals must have the same length"}

      Enum.sort(preorder) != Enum.sort(inorder) ->
        {:error, "traversals must have the same elements"}

      Enum.uniq(preorder) != preorder ->
        {:error, "traversals must contain unique items"}

      true ->
        root = Enum.at(preorder, 0)
        root_index = Enum.find_index(inorder, &(&1 == root))

        left_inorder = Enum.take(inorder, root_index)
        right_inorder = Enum.drop(inorder, root_index + 1)

        left_preorder = Enum.drop(preorder, 1) |> Enum.take(root_index)
        right_preorder = Enum.drop(preorder, root_index + 1)

        {:ok, left} = build_tree(left_preorder, left_inorder)
        {:ok, right} = build_tree(right_preorder, right_inorder)
        {:ok, {left, root, right}}
    end
  end
end
