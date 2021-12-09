require "./lib/day_2"

describe Day2 do
  context "part 2" do
    context "sample input" do
      it "works" do
        actual_output = Day2.part_2(sample_input_path)

        expect(actual_output).to eq(900)
      end
    end

    context "puzzle input" do
      it "works" do
        actual_output = Day2.part_2(puzzle_input_path)

        expect(actual_output).to eq(1320534480)
      end
    end
  end

  def sample_input_path
    "./spec/support/fixtures/day_2_sample.txt"
  end

  def puzzle_input_path
    "./spec/support/fixtures/day_2.txt"
  end
end
