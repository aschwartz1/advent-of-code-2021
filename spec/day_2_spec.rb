require "./lib/day_2"

describe Day2 do
  context "output structure" do
    it "returns a hash with known keys" do
      actual_output = Day2.run(puzzle_input)

      expect(actual_output).to be_a(Hash)
      expect(actual_output.keys).to match([:horizontal, :depth])
    end
  end

  context "horizontal movement" do
    context "forward" do
      it "adds to the horizontal position of the submarine" do
        actual_output = Day2.run(["forward 1"])

        expect(actual_output).to match({horizontal: 1, depth: 0})
      end
    end
  end

  context "vertical movement" do
    context "up" do
      it "decreases submarine depth" do
        actual_output = Day2.run(["up 1"])

        expect(actual_output).to match({horizontal: 0, depth: -1})
      end
    end

    context "down" do
      it "increases submarine depth" do
        actual_output = Day2.run(["down 1"])

        expect(actual_output).to match({horizontal: 0, depth: 1})
      end
    end
  end

  context "puzzle input" do
    it "produces correct output" do
      input = puzzle_input

      actual_output = Day2.run(input)

      expect(actual_output).to match({horizontal: 15, depth: 10})
      expect(actual_output[:horizontal] * actual_output[:depth]).to eq(150)
    end
  end
  def puzzle_input
    @input ||= File.readlines("./spec/support/fixtures/day_2.txt", chomp: true)
  end
end
