require "./lib/day_3"

describe Day3 do
  context "part 1" do
    context "sample input" do
      it "works" do
        runner = Day3.new(sample_input_path)

        expect(runner.part1).to eq(198)
      end
    end

    context "puzzle input" do
      it "works" do
        runner = Day3.new(puzzle_input_path)

        expect(runner.part1).to eq(2648450)
      end
    end
  end

  def sample_input_path
    "./spec/support/fixtures/day_3_sample.txt"
  end

  def puzzle_input_path
    "./spec/support/fixtures/day_3.txt"
  end
end
