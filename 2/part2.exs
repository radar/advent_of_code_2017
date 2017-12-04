defmodule Day2.Part2 do
  def run({:ok, contents}) do
    contents
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn (line) ->
      line
      |> String.split(~r/[\s\t]/)
      |> Enum.map(&String.to_integer/1)
      |> checksum
    end)
    |> Enum.sum
  end

  defp checksum(numbers) do
    numbers
    |> Enum.with_index
    |> Enum.flat_map(fn ({num, i}) ->
      numbers
      |> List.delete_at(i)
      |> Enum.map(fn (num2) -> num / num2 end)
    end)
    |> Enum.filter(fn (num) ->
      Float.round(num, 0) == num
    end)
    |> Enum.sum
  end
end

File.read("input.txt") |> Day2.Part2.run |> IO.puts

