@input = File.readlines("input.txt")

sum_part_one = 0
sum_part_two = 0
number_of_people = 0
answers = {}

@input.each_with_index do |line, index|
  next if line == "\n"

  line.chomp.chars.each do |letter|
    answers[letter] = 0 if answers[letter].nil?
    answers[letter] += 1
  end

  number_of_people += 1

  if @input[index + 1] == "\n" || index == @input.length - 1
    sum_part_one += answers.values.count
    sum_part_two += answers.values.count { |answer| answer == number_of_people }

    answers = {}
    number_of_people = 0
  end
end

puts "Part 1: Everyone answered yes - #{sum_part_one}"
puts "Part 2: Everyone answered yes - #{sum_part_two}"