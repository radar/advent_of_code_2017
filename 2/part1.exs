defmodule Day2.Part1 do
  def run({:ok, contents}) do
    contents
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn (line) ->
      line
      |> String.split("\t")
      |> Enum.map(&String.to_integer/1)
      |> checksum
    end)
    |> Enum.sum
  end

  defp checksum(numbers) do
    Enum.max(numbers) - Enum.min(numbers)
  end
end
File.read("input.txt") |> Day2.Part1.run |> IO.puts

