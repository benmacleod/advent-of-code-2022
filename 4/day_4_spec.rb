require_relative "day_4"

RSpec.describe Day4 do
  describe ".count_containing_rosters" do
    it "counts the number of pairs where one of the pair's rosters fully contains the other's" do
      expect(
        Day4.count_containing_rosters(
          %w[2-4,6-8 2-3,4-5 5-7,7-9 2-8,3-7 6-6,4-6 2-6,4-8],
        ),
      ).to eq(2)
    end
  end

  describe ".count_overlapping_rosters" do
    it "counts the number of pairs where one of the pair's rosters overlaps with the other's" do
      expect(
        Day4.count_overlapping_rosters(
          %w[2-4,6-8 2-3,4-5 5-7,7-9 2-8,3-7 6-6,4-6 2-6,4-8],
        ),
      ).to eq(4)
    end
  end

  describe ".rosters_to_ranges" do
    it "transforms a pair of rosters into a pair of ranges" do
      expect(Day4.rosters_to_ranges("2-4,6-8")).to eq([2..4, 6..8])
    end
  end

  describe ".roster_to_range" do
    it "transforms a roster into a range" do
      expect(Day4.roster_to_range("2-4")).to eq(2..4)
    end
  end

  describe ".fully_contains?" do
    it "is true if one range fully contains the other" do
      expect(Day4.fully_contains?([1..5, 2..4])).to be true
    end

    it "is false if neither range fully contains the other" do
      expect(Day4.fully_contains?([1..7, 6..8])).to be false
    end
  end

  describe ".overlaps?" do
    it "is true if one range overlaps with the other" do
      expect(Day4.overlaps?([1..2, 2..4])).to be true
    end

    it "is false if one range doesn't overlap with the other" do
      expect(Day4.overlaps?([1..2, 3..4])).to be false
    end
  end
end
