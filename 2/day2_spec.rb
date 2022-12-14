require_relative "part_1"

describe Day2 do
  describe ".convert" do
    it "converts lines to arrays of numbers" do
      expect(Day2.convert(["A X", "B Z"])).to eq([[1, 1], [2, 3]])
    end
  end

  describe ".total" do
    it "adds up the games' scores" do
      expect(Day2.total([[Day2::ROCK, Day2::ROCK], [Day2::PAPER, Day2::SCISSORS], [Day2::SCISSORS, Day2::PAPER]])).to eq(15)
    end
  end

  describe ".score" do
    it "scores a draw" do
      expect(Day2.score([Day2::ROCK, Day2::ROCK])).to eq(4)
    end

    it "scores a win" do
      expect(Day2.score([Day2::PAPER, Day2::SCISSORS])).to eq(9)
    end

    it "scores a loss" do
      expect(Day2.score([Day2::SCISSORS, Day2::PAPER])).to eq(2)
    end
  end

  describe ".apply_strategy" do
    it "returns the same for the FOLLOW strategy" do
      expect(Day2.apply_strategy([Day2::ROCK, Day2::PAPER], Day2::FOLLOW)).to eq([Day2::ROCK, Day2::PAPER])
    end

    context "for the REACT strategy" do
      it "returns a loss" do
        expect(Day2.apply_strategy([Day2::ROCK, Day2::LOSE], Day2::REACT)).to eq([Day2::ROCK, Day2::SCISSORS])
        expect(Day2.apply_strategy([Day2::PAPER, Day2::LOSE], Day2::REACT)).to eq([Day2::PAPER, Day2::ROCK])
        expect(Day2.apply_strategy([Day2::SCISSORS, Day2::LOSE], Day2::REACT)).to eq([Day2::SCISSORS, Day2::PAPER])
      end

      it "returns a draw" do
        expect(Day2.apply_strategy([Day2::ROCK, Day2::DRAW], Day2::REACT)).to eq([Day2::ROCK, Day2::ROCK])
        expect(Day2.apply_strategy([Day2::PAPER, Day2::DRAW], Day2::REACT)).to eq([Day2::PAPER, Day2::PAPER])
        expect(Day2.apply_strategy([Day2::SCISSORS, Day2::DRAW], Day2::REACT)).to eq([Day2::SCISSORS, Day2::SCISSORS])
      end

      it "returns a win" do
        expect(Day2.apply_strategy([Day2::ROCK, Day2::SCISSORS], Day2::REACT)).to eq([Day2::ROCK, Day2::PAPER])
        expect(Day2.apply_strategy([Day2::PAPER, Day2::SCISSORS], Day2::REACT)).to eq([Day2::PAPER, Day2::SCISSORS])
        expect(Day2.apply_strategy([Day2::SCISSORS, Day2::SCISSORS], Day2::REACT)).to eq([Day2::SCISSORS, Day2::ROCK])
      end
    end
  end

  describe ".result" do
    it "returns a draw" do
      expect(Day2.result([Day2::ROCK, Day2::ROCK])).to eq([3, 3])
      expect(Day2.result([Day2::PAPER, Day2::PAPER])).to eq([3, 3])
      expect(Day2.result([Day2::SCISSORS, Day2::SCISSORS])).to eq([3, 3])
    end

    it "returns a win/loss result" do
      expect(Day2.result([Day2::ROCK, Day2::PAPER])).to eq([0, 6])
      expect(Day2.result([Day2::ROCK, Day2::SCISSORS])).to eq([6, 0])
      expect(Day2.result([Day2::PAPER, Day2::ROCK])).to eq([6, 0])
      expect(Day2.result([Day2::PAPER, Day2::SCISSORS])).to eq([0, 6])
      expect(Day2.result([Day2::SCISSORS, Day2::ROCK])).to eq([0, 6])
      expect(Day2.result([Day2::SCISSORS, Day2::PAPER])).to eq([6, 0])
    end
  end

  describe ".nemesis" do
    it "is paper for rock" do
      expect(Day2.nemesis(Day2::ROCK)).to eq(Day2::PAPER)
    end

    it "is scissors for paper" do
      expect(Day2.nemesis(Day2::PAPER)).to eq(Day2::SCISSORS)
    end

    it "is rock for scissors" do
      expect(Day2.nemesis(Day2::SCISSORS)).to eq(Day2::ROCK)
    end
  end
end