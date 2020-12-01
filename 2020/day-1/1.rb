numbers = File.read("input.txt").split.map(&:to_i)
SUM_TO_FIND = 2020

# Here's the less elegant solution I first came up with

# A side note: You can't break out of nested loops in Ruby, TIL!
# https://stackoverflow.com/questions/5286861/how-to-break-from-nested-loops-in-ruby

def find_product_for_two_numbers(numbers)
  for number_1 in numbers
    for number_2 in numbers
      if number_1 + number_2 == SUM_TO_FIND
        puts "Product of two numbers: #{number_1 * number_2}"
  
        return
      end
    end
  end
end

def find_product_for_three_numbers(numbers)
  for number_1 in numbers
    for number_2 in numbers
      for number_3 in numbers
        if number_1 + number_2 + number_3 == SUM_TO_FIND
          puts "Product of three numbers: #{number_1 * number_2 * number_3}"

          return
        end
      end
    end
  end
end

find_product_for_two_numbers(numbers)
find_product_for_three_numbers(numbers)

# I found out that there this method in Ruby that returns all
# combinations possible after searching for some Ruby tricks:
# https://apidock.com/ruby/Array/combination
# a = [1, 2, 3, 4]
# a.combination(1).to_a  #=> [[1],[2],[3],[4]]
# a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]

def find_product(combination_num, numbers)
  product = numbers.combination(combination_num).find do |combination_array|
    combination_array.sum == SUM_TO_FIND
  end.inject(:*)

  puts "Product for #{combination_num} numbers: #{product}"
end

find_product(2, numbers)
find_product(3, numbers)
