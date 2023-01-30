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
        {:ok, do_build_tree(preorder, inorder)}
    end
  end

  defp do_build_tree([], inorder), do: {}

  defp do_build_tree([current | preorder], inorder) do
    {left_inorder, [_ | right_inorder]} = Enum.split_while(inorder, &(&1 != current))
    {left_preorder, right_preorder} = Enum.split(preorder, Enum.count(left_inorder))

    left = do_build_tree(left_preorder, left_inorder)
    right = do_build_tree(right_preorder, right_inorder)
    {left, current, right}
  end
end
