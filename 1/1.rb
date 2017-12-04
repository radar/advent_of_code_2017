def part1
  input = parse_input

  sum = input[0..-2].each_with_index.inject(0) do |sum, (n, i)|
    input[i+1] == n ? sum += n : sum
  end

  sum += input[-1] if input[-1] == input[0]

  sum.to_i
end

def part2
  input = parse_input
  flipped_input = input.rotate(input.length/2)

  sum = input.each_with_index.inject(0) do |sum, (n, i)|
    flipped_input[i] == n ? sum += n : sum
  end

  sum.to_i
end

def parse_input
  ARGV[0].split("").map(&:to_i)
end

puts "Part 1: #{part1()}"
puts "Part 2: #{part2()}"

