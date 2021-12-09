require "./lib/day_3"

describe Day3 do
  context "delete later" do
    context "adding sets of binary numbers" do
      it "works" do
        runner = Day3.new(["00100", "11110", "10110", "10010"])

        expect(runner.add_binaries).to eq([3, 1, 3, 3, 0])
      end
    end

    context "gamma and epsilon rates" do
      it "works" do
        runner = Day3.new(["00100", "11110", "10110", "10010"])

        runner.calculate_rates

        expect(runner.gamma_rate).to eq([1, 0, 1, 1, 0])
        expect(runner.epsilon_rate).to eq([0, 1, 0, 0, 1])
      end
    end
  end

  context "part 1" do
    context "sample input" do
      it "works" do
      end
    end

    context "puzzle input" do
      it "works" do
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
