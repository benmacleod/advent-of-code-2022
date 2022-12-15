class Day3
  PRIORITIES = ("a".upto("z").to_a + "A".upto("Z").to_a).join("").freeze

  def self.prioritize_many_misplaced(rucksacks)
    rucksacks.inject(0) { |total, rucksack| total += prioritize_misplaced(rucksack) }
  end

  def self.prioritize_many_badges(rucksacks)
    rucksacks.each_slice(3).inject(0) do |total, rucksacks|
      total += get_priority(find_badge(rucksacks))
    end
  end

  def self.prioritize_misplaced(rucksack)
    get_priority(misplaced_item(rucksack))
  end

  def self.find_badge(rucksacks)
    rucksacks.map { |rucksack| rucksack.chars.to_a }.inject(:&).first
  end

  def self.get_priority(letter)
    PRIORITIES.index(letter) + 1
  end

  def self.misplaced_item(rucksack)
    compartments = partition(rucksack)
    (compartments[0] & compartments[1]).first
  end

  def self.partition(rucksack)
    rucksack.chars.each_slice(rucksack.length / 2).to_a
  end
end

input = File.readlines("3/input")
puts Day3.prioritize_many_misplaced(input)
puts Day3.prioritize_many_badges(input)
