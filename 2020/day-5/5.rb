
@input = File.readlines("input.txt")

def get_seat_number(string, starting_lower, starting_upper, lower_letter)
  lower = starting_lower
  upper = starting_upper

  string.split("").each do |letter|
    middle = (lower + upper) / 2

    if letter == lower_letter
      upper = middle
    else
      lower = middle + 1
    end
  end
 
  return lower # or upper, they're the same by this point
end

highest = 0
seat_ids = []

@input.each do |seat|
  row = get_seat_number(seat[0..6], 0, 127, "F")
  column = get_seat_number(seat[7..9], 0, 7, "L")

  seat_id = (row * 8) + column
  puts seat if seat_id == 879
  highest = seat_id if seat_id > highest
  seat_ids << seat_id
end

puts "Part 1: Highest seat number - #{highest}"

seat_ids.sort!

(seat_ids.first..seat_ids.last).each do |seat_id|
  puts "Part 2: Your seat number - #{seat_id}" unless seat_ids.include?(seat_id)
end
