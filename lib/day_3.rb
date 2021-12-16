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

  def part2
    binaries_array = @binaries.map { |binary_string| binary_string.chars.map(&:to_i) }

    oxygen_generator_binary = calculate_oxygen_generator(binaries_array)
    co2_scrubber_binary = calculate_co2_scrubber(binaries_array)

    # TODO: turn them into ints, multiply together & return
    #   - will need to generalize the multiply_rates method so I can reuse it
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
  end

  def calculate_oxygen_generator(binaries_array)
    recursive_most_common(binaries_array)
  end

  def calculate_co2_scrubber(binaries_array)
    recursive_least_common(binaries_array)
  end

  def recursive_most_common(set, position: 0)
    one_subset = []
    zero_subset = []
    positional_sum = 0

    set.each do |binary_array|
      one_subset << binary_array if binary_array[position] == 1
      zero_subset << binary_array if binary_array[position] == 0

      positional_sum += binary_array[position]
    end

    one_is_most_common = positional_sum >= (set.length / 2.0)

    subset = one_is_most_common ? one_subset : zero_subset

    if subset.length == 1
      subset.flatten
    else
      recursive_most_common(subset, position: (position + 1))
    end
  end

  def recursive_least_common(set, position: 0)
    one_subset = []
    zero_subset = []
    positional_sum = 0

    set.each do |binary_array|
      one_subset << binary_array if binary_array[position] == 1
      zero_subset << binary_array if binary_array[position] == 0

      positional_sum += binary_array[position]
    end

    zero_is_least_common = positional_sum >= (set.length / 2.0)

    subset = zero_is_least_common ? zero_subset : one_subset

    if subset.length == 1
      subset.flatten
    else
      recursive_least_common(subset, position: (position + 1))
    end
  end
end
