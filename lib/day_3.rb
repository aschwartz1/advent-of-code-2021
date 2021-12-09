class Day3
  attr_accessor :binaries
  attr_reader :epsilon_rate, :gamma_rate

  def initialize(binaries)
    @binaries = binaries
    @epsilon_rate = [0, 0, 0, 0, 0]
    @gamma_rate = [0, 0, 0, 0, 0]
  end

  def calculate_rates
    positional_sums = add_binaries
    gamma_epsilon_threshold = @binaries.length / 2

    positional_sums.each_with_index do |total, i|
      @gamma_rate[i] = total > gamma_epsilon_threshold ? 1 : 0
      @epsilon_rate[i] = total < gamma_epsilon_threshold ? 1 : 0
    end
  end

  def add_binaries
    sum = [0, 0, 0, 0, 0]
    @binaries.each do |binary|
      split = binary.chars.map(&:to_i)

      split.each_with_index do |value, i|
        sum[i] += value
      end
    end

    sum
  end

  private

  def read_input(filepath)
    File.readlines(filepath, chomp: true)

    # File.open(filepath).map do |line|
    #   parse(line)
    # end
  end
end
