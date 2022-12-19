require_relative "day_6"

RSpec.describe Day6 do
  describe ".find_start_marker" do
    it "returns the number of chars processed to find the start of packet marker" do
      expect(Day6.find_start_marker("bvwbjplbgvbhsrlpgdmjqwftvncz")).to eq(5)
      expect(Day6.find_start_marker("nppdvjthqldpwncqszvftbrmjlhg")).to eq(6)
      expect(Day6.find_start_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")).to eq(10)
      expect(Day6.find_start_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")).to eq(11)
    end

    it "returns the number of chars processed to find the start of message marker" do
      expect(Day6.find_start_marker("mjqjpqmgbljsphdztnvjfqwrcgsmlb", unique_chars: Day6::MESSAGE)).to eq(19)
      expect(Day6.find_start_marker("bvwbjplbgvbhsrlpgdmjqwftvncz", unique_chars: Day6::MESSAGE)).to eq(23)
      expect(Day6.find_start_marker("nppdvjthqldpwncqszvftbrmjlhg", unique_chars: Day6::MESSAGE)).to eq(23)
      expect(Day6.find_start_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", unique_chars: Day6::MESSAGE)).to eq(29)
      expect(Day6.find_start_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", unique_chars: Day6::MESSAGE)).to eq(26)
    end
  end
end