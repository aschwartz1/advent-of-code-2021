require "./lib/day_2"

describe Day2 do
  context "horizontal movement" do
    context "forward" do
      xit "adds to the horizontal position of the submarine" do
        actual_output = Day2.run(["forward 1"])

        expect(actual_output).to match({horizontal: 1, depth: 0})
      end
    end
  end

  context "vertical movement" do
    context "up" do
      xit "decreases submarine depth" do
        actual_output = Day2.run(["up 1"])

        expect(actual_output).to match({horizontal: 0, depth: -1})
      end
    end

    context "down" do
      xit "increases submarine depth" do
        actual_output = Day2.run(["down 1"])

        expect(actual_output).to match({horizontal: 0, depth: 1})
      end
    end
  end

  context "sample input" do
    it "answers correctly" do
      actual_output = Day2.new.part_1(sample_input_path)

      expect(actual_output).to eq(150)
    end
  end

  context "puzzle input" do
    it "works" do
      actual_output = Day2.new.part_1(puzzle_input_path)

      expect(actual_output).to eq(1459206)
    end
  end

  def sample_input_path
    "./spec/support/fixtures/day_2_sample.txt"
  end

  def puzzle_input_path
    "./spec/support/fixtures/day_2.txt"
  end
end
