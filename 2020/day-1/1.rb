numbers = File.read("input.txt").split.map(&:to_i)
SUM_TO_FIND = 2020

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

# A side note: You can't break out of nested loops in Ruby, TIL!
# https://stackoverflow.com/questions/5286861/how-to-break-from-nested-loops-in-ruby