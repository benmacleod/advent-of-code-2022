most_calories = 0
current_calories = 0

File
  .readlines("1/input")
  .each do |line|
    line = line.chomp
    if line == ""
      most_calories = current_calories if current_calories > most_calories
      current_calories = 0
    else
      current_calories += line.to_i
    end
  end

puts most_calories
