class Day3
  attr_accessor :binaries
  attr_reader :epsilon_rate, :gamma_rate

  def initialize(filepath)
    @binaries = read_input(filepath)
    @binary_length = @binaries.first.length
    @epsilon_rate = Array.new(@binary_length, 0)
    @gamma_rate = Array.new(@binary_length, 0)
  end

  def part1
    calculate_rates

    multiply_rates
  end

  private

  def add_binaries
    sum = Array.new(@binary_length, 0)
    @binaries.each do |binary|
      split = binary.chars.map(&:to_i)

      split.each_with_index do |value, i|
        sum[i] += value
      end
    end

    sum
  end

  def binary_to_decimal(binary_string)
    binary_string.to_i(2)
  end

  def calculate_rates
    positional_sums = add_binaries
    gamma_epsilon_threshold = @binaries.length / 2

    positional_sums.each_with_index do |total, i|
      @gamma_rate[i] = total > gamma_epsilon_threshold ? 1 : 0
      @epsilon_rate[i] = total < gamma_epsilon_threshold ? 1 : 0
    end
  end

  def multiply_rates
    gamma_decimal = binary_to_decimal(@gamma_rate.join)
    epsilon_decimal = binary_to_decimal(@epsilon_rate.join)

    gamma_decimal * epsilon_decimal
  end

  def read_input(filepath)
    File.readlines(filepath, chomp: true)

    # File.open(filepath).map do |line|
    #   parse(line)
    # end
  end
end
