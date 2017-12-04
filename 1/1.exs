defmodule Day1 do
  def part1 do
    input = parse_input()
    sum = input
    |> Enum.slice(0..-2)
    |> Enum.with_index
    |> Enum.reduce(0, fn ({n, i}, sum) ->
      if Enum.at(input, i+1) == n, do: sum + n, else: sum
    end)

    last = Enum.at(input, -1)

    if(last == hd(input), do: sum + last, else: sum)
    |> IO.puts
  end

  defp parse_input do
    [input] = System.argv

    input
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

Day1.part1
