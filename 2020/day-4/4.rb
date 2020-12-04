
@input = File.readlines("input.txt")

required_fields = %w[byr iyr eyr hgt hcl ecl pid]
valid_part_one = 0
valid_part_two = 0
passport = {}

def validate_field(key, value)
  case key
  when "byr"
    value.to_i.between?(1920, 2002)
  when "iyr"
    value.to_i.between?(2010, 2020)
  when "eyr"
    value.to_i.between?(2020, 2030)
  when "hgt"
    height, unit = value.split(/(cm|in)/)
    if unit == "cm"
      value.to_i.between?(150, 193)
    elsif unit == "in"
      value.to_i.between?(59, 76)
    else
      false
    end
  when "hcl"
    /^#[a-f0-9]{6}$/ === value
  when "ecl" 
    %w[amb blu brn gry grn hzl oth].include?(value)
  when "pid"
    /^[0-9]{9}$/ === value
  when "cid"
    true
  else
    false
  end
end

@input.each_with_index do |line, index|
  next if line == "\n"

  line.split(" ").each do |field|
    key, value = field.split(":")
    passport[key] = value
  end

  if @input[index + 1] == "\n" || index == @input.length - 1
    if required_fields - passport.keys == []
      valid_part_one += 1 
      valid_part_two += 1  if passport.all? { |key, value| validate_field(key, value) }
    end

    passport = {}
  end
end

puts "Part 1: Valid Passports - #{valid_part_one}"
puts "Part 2: Valid Passports - #{valid_part_two}"