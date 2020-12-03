require "active_support/core_ext/object/blank"

@input = File.readlines("input.txt")

def traverse_slopes(slopes)
  return slopes.map do |slope|
    trees, x, y = 0, slope[1], slope[0]

    @input.each do |path|
      trees += 1 if @input[x].present? && @input[x][y % (path.length - 1)] == "#"

      x += slope[1]
      y += slope[0]
    end

    trees
  end.inject(:*)
end

puts "Part 1: Number of trees encountered: #{traverse_slopes([[3, 1]])}"
puts "Part 2: Number of trees encountered: #{traverse_slopes([[1,1], [3, 1], [5, 1], [7, 1], [1, 2]])}"

