require_relative "day_3"

RSpec.describe Day3 do
  describe ".prioritize_many_misplaced" do
    it "returns the sum of the priority numbers of misplaced items in many rucksacks" do
      expect(
        Day3.prioritize_many_misplaced(
          %w[
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
            wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
            ttgJtRGJQctTZtZT
            CrZsJsPPZsGzwwsLwLmpwMDw
          ],
        ),
      ).to eq(157)
    end
  end

  describe ".prioritize_many_badges" do
    it "returns the sum of the priority numbers of group badges in many rucksacks" do
      expect(
        Day3.prioritize_many_badges(
          %w[
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
            wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
            ttgJtRGJQctTZtZT
            CrZsJsPPZsGzwwsLwLmpwMDw
          ],
        ),
      ).to eq(70)
    end
  end

  describe ".find_badge" do
    it "finds the badge in a group's rucksacks" do
      expect(
        Day3.find_badge(
          %w[
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
          ],
        ),
      ).to eq("r")
    end
  end

  describe ".prioritize_misplaced" do
    it "returns the priority number of the misplaced item in the rucksack" do
      expect(Day3.prioritize_misplaced("vJrwpWtwJgWrhcsFMMfFFhFp")).to eq(16)
    end
  end

  describe ".get_priority" do
    it "finds the priority number for the letter" do
      expect(Day3.get_priority("v")).to eq(22)
      expect(Day3.get_priority("V")).to eq(48)
    end
  end

  describe ".misplaced_item" do
    it "finds the item in both compartments of a rucksack" do
      expect(Day3.misplaced_item("vJrwpWtwJgWrhcsFMMfFFhFp")).to eq("p")
    end
  end

  describe ".partition" do
    it "finds the contents of both compartments of a rucksack" do
      expect(Day3.partition("vJrwpWtwJgWrhcsFMMfFFhFp")).to eq(
        [%w[v J r w p W t w J g W r], %w[h c s F M M f F F h F p]],
      )
    end
  end
end
