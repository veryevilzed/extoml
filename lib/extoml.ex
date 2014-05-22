defmodule ExToml do
  
  defp to_map([{k,v}|list]) when is_list(list) do
    [{k,v}|list] |> Enum.reduce %{}, fn({key, value}, acc) -> Dict.put acc, key, to_map(value); end
  end

  defp to_map(list) when is_list(list), do: list

  defp to_map(list), do: list

  def parse(text) do
    case :etoml.parse(text) do
      {:ok, toml} -> {:ok, to_map(toml) }
      err -> err
    end
  end
end
