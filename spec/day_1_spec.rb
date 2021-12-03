require "./lib/day_1"

describe Day1 do
  context "return value structure" do
    it "returns an array of hashes" do
      input = [100]

      output = Day1.run(input)

      expect(output).to be_an(Array)
      expect(output.first).to be_a(Hash)
    end
  end

  context "when reading the first depth value" do
    it "returns message saying there is no previous measurement" do
      input = [100]

      expected_output = [{"100" => no_previous_text}]

      actual_output = Day1.run(input)

      expect(actual_output).to eq(expected_output)
    end
  end

  context "when comparing two depth values" do
    context "and the second is higher than the first" do
      it "returns correct data" do
        input = [100, 200]

        expected_output = [
          {"100" => no_previous_text},
          {"200" => increase_text}
        ]

        actual_output = Day1.run(input)

        expect(actual_output).to eq(expected_output)
      end
    end

    context "and the second is lower than the first" do
      it "returns correct data" do
        input = [100, 50]

        expected_output = [
          {"100" => no_previous_text},
          {"50" => decrease_text}
        ]

        actual_output = Day1.run(input)

        expect(actual_output).to eq(expected_output)
      end
    end

    context "and the values are the same" do
      it "returns correct data" do
        input = [100, 100]

        expected_output = [
          {"100" => no_previous_text},
          {"100" => no_change_text}
        ]

        actual_output = Day1.run(input)

        expect(actual_output).to eq(expected_output)
      end
    end
  end

  context "puzzle input" do
    it "produces a correct solution" do
      input = puzzle_input

      expected_output = [
        {"199" => no_previous_text},
        {"200" => increase_text},
        {"208" => increase_text},
        {"210" => increase_text},
        {"200" => decrease_text},
        {"207" => increase_text},
        {"240" => increase_text},
        {"269" => increase_text},
        {"260" => decrease_text},
        {"263" => increase_text}
      ]

      actual_output = Day1.run(input)

      expect(actual_output).to eq(expected_output)
    end
  end

  def no_previous_text
    "(N/A - no previous measurement)"
  end

  def increase_text
    "(increased)"
  end

  def decrease_text
    "(decreased)"
  end

  def no_change_text
    "(no change)"
  end

  def puzzle_input
    @input ||= File.readlines("./spec/support/fixtures/day_1.txt", chomp: true)
  end
end
