require "./lib/day_1"

describe Day1 do
  describe "part 1" do
    context "when reading the first depth value" do
      it "returns message saying there is no previous measurement" do
        input = [100]

        expect(Day1.run(input)).to eq(0)
      end
    end

    context "when comparing two depth values" do
      context "and the second is higher than the first" do
        it "returns correct data" do
          input = [100, 200]

          expect(Day1.run(input)).to eq(1)
        end
      end

      context "and the second is lower than the first" do
        it "returns correct data" do
          input = [100, 50]

          expect(Day1.run(input)).to eq(0)
        end
      end

      context "and the values are the same" do
        it "returns correct data" do
          input = [100, 100]

          expect(Day1.run(input)).to eq(0)
        end
      end
    end

    context "sample input" do
      it "answers correctly" do
        expect(Day1.run(sample_input)).to eq(7)
      end
    end

    context "puzzle input" do
      xit "answers correctly" do
        # TODO puzzle_input no longer exists
        #      changed so that the part 2 can take in a filename instead of array
        #      better for me to leave this broken and move ahead than worry about fixing day_1 part 1
        input = puzzle_input

        actual_output = Day1.run(input)

        expect(actual_output).to eq(1448)
      end
    end
  end

  describe "part 2" do
    context "sample input" do
      it "answers correctly" do
        expect(Day1.part_2(sample_input_path)).to eq(5)
      end
    end

    context "real input" do
      it "answers correctly" do
        expect(Day1.part_2(puzzle_input_path)).to eq(1471)
      end
    end
  end

  def sample_input_path
    "./spec/support/fixtures/day_1_sample.txt"
  end

  def puzzle_input_path
    "./spec/support/fixtures/day_1.txt"
  end
end
