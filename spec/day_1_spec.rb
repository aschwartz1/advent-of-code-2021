require "./lib/day_1"

describe Day1 do
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

  context "puzzle input" do
    it "produces a correct solution" do
      input = puzzle_input

      actual_output = Day1.run(input)

      expect(actual_output).to eq(1448)
    end
  end

  def puzzle_input
    # %w[
    #   199
    #   200
    #   208
    #   210
    #   200
    #   207
    #   240
    #   269
    #   260
    #   263
    # ]

    @input ||= File.readlines("./spec/support/fixtures/day_1.txt", chomp: true)
  end
end
