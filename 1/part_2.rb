elf_calories = []
current_calories = 0

File
  .readlines("1/input")
  .each do |line|
    line = line.chomp
    if line == ""
      elf_calories << current_calories
      current_calories = 0
    else
      current_calories += line.to_i
    end
  end

puts elf_calories.max(3).sum
