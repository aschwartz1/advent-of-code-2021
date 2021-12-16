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

  context "part 2" do
    context "sample input" do
      it "works" do
        runner = Day3.new(sample_input_path)

        expect(runner.part2).to eq("10111")
      end
    end

    context "puzzle input" do
      it "works" do
      end
    end
  end

  def test_input
    %w[
      00100
      11110
      10110
      10111
      10101
      01111
      00111
      11100
      10000
      11001
      00010
      01010
    ].map { |binary| binary.chars.map(&:to_i) }
  end

  def sample_input_path
    "./spec/support/fixtures/day_3_sample.txt"
  end

  def puzzle_input_path
    "./spec/support/fixtures/day_3.txt"
  end
end
