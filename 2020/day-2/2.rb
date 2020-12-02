password_list = File.readlines("input.txt")

# Sample list
# password_list = [
#   "1-3 a: abcde",
#   "1-3 b: cdefg",
#   "2-9 c: ccccccccc"
# ]

valid_passwords_1 = 0
valid_passwords_2 = 0
  
password_list.each do |password_line|
  # Some cool RegEx right here to separate the needed details
  lower_limit, higher_limit, test_letter, password = password_line.split(/-| |: /)
  
  # Alternatively, we can use .scan for this
  occurences = password.count(test_letter)
  
  if occurences >= lower_limit.to_i && occurences <= higher_limit.to_i
    valid_passwords_1 += 1 
  end

   # ^ is Ruby's XOR operator!
  if (password[lower_limit.to_i - 1] == test_letter) ^
    (password[higher_limit.to_i - 1] == test_letter)
    valid_passwords_2 += 1 
  end
end

puts "Number of Valid Passwords (Part 1): #{valid_passwords_1}"
puts "Number of Valid Passwords (Part 2): #{valid_passwords_2}"
