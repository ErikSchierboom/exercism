defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part({:defp, _, args} = ast_node, acc),
    do: {ast_node, [secret_message_part(args) | acc]}

  def decode_secret_message_part({:def, _, args} = ast_node, acc),
    do: {ast_node, [secret_message_part(args) | acc]}

  def decode_secret_message_part(ast_node, acc), do: {ast_node, acc}

  defp secret_message_part([{:when, _, args} | _]), do: secret_message_part(args)

  defp secret_message_part([{name, _, args} | _]) do
    String.slice(Atom.to_string(name), 0, Enum.count(args || []))
  end

  def decode_secret_message(string) do
    string |> to_ast() |> do_decode_secret_message([]) |> Enum.join()
  end

  defp do_decode_secret_message({:defmodule, _, ast_nodes}, acc),
    do: do_decode_secret_message(ast_nodes, acc)

  defp do_decode_secret_message({:do, ast_nodes}, acc),
    do: do_decode_secret_message(ast_nodes, acc)

  defp do_decode_secret_message({:__block__, _, ast_nodes}, acc),
    do: do_decode_secret_message(ast_nodes, acc)

  defp do_decode_secret_message({:defp, _, _} = ast_node, acc),
    do: decode_secret_message_part(ast_node, acc) |> elem(1)

  defp do_decode_secret_message({:def, _, _} = ast_node, acc),
    do: decode_secret_message_part(ast_node, acc) |> elem(1)

  defp do_decode_secret_message(ast_node, acc) when is_list(ast_node),
    do: List.foldr(ast_node, acc, &do_decode_secret_message/2)

  defp do_decode_secret_message(_, acc), do: acc
end
