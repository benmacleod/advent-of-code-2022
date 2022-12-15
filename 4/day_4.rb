class Day4
  def self.count_containing_rosters(pairs)
    pairs.inject(0) do |count, pair|
      count += 1 if fully_contains?(rosters_to_ranges(pair))
      count
    end
  end

  def self.count_overlapping_rosters(pairs)
    pairs.inject(0) do |count, pair|
      count += 1 if overlaps?(rosters_to_ranges(pair))
      count
    end
  end

  def self.rosters_to_ranges(pair)
    pair.split(",").map { |roster| roster_to_range(roster) }
  end

  def self.roster_to_range(roster)
    sections = roster.split("-").map(&:to_i)
    sections[0]..sections[1]
  end

  def self.fully_contains?(ranges)
    ranges[0].cover?(ranges[1]) || ranges[1].cover?(ranges[0])
  end

  def self.overlaps?(ranges)
    (ranges[0].to_a & ranges[1].to_a).any?
  end
end

puts Day4.count_containing_rosters(File.readlines("4/input"))
puts Day4.count_overlapping_rosters(File.readlines("4/input"))