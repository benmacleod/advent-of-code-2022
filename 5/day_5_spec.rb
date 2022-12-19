require_relative "day_5"

RSpec.describe Day5 do
  describe ".decode_arrangememnt" do
    it "decodes the arrangment into an array of arrays" do
      expect(
        Day5.decode_arrangement(
          ["[D]", "[N]     [C]", "[Z] [M] [P]", " 1   2   3"],
        ),
      ).to eq([%w[D N Z], %w[M], %w[C P]])
    end
  end

  describe ".apply_move" do
    context "CrateMover 9000" do
      it "moves the given number of boxes from the specified stack to the top of the other stack" do
        expect(
          Day5.apply_move([%w[D N Z], %w[C M], %w[P]], "move 3 from 1 to 3"),
        ).to eq([[], %w[C M], %w[Z N D P]])
      end
    end

    context "CrateMover 9001" do
      it "moves the given number of boxes from the specified stack to the top of the other stack" do
        expect(
          Day5.apply_move([%w[D N Z], %w[C M], %w[P]], "move 3 from 1 to 3", crane: Day5::CRATEMOVER_9001),
        ).to eq(([[], %w[C M], %w[D N Z P]]))
      end
    end
  end
end
