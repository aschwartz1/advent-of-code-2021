class Day1
  def self.run(input)
    previous_depth = nil
    increases = 0

    input.each_with_index do |current_depth, i|
      change = delta_for(previous_depth, current_depth)

      increases += 1 if change == :increase

      previous_depth = current_depth
    end

    increases
  end

  def self.part_2(filepath)
    input = read(filepath)

    previous_depth_set = nil
    increases = 0

    input.each_cons(3).with_index do |current_depth_set, i|
      change = delta_for(sum(previous_depth_set), sum(current_depth_set))

      increases += 1 if change == :increase

      previous_depth_set = current_depth_set
    end

    increases
  end

  class << self
    private

    def delta_for(previous, current)
      return :no_previous if previous.nil?
      return :increase if current > previous
      return :decrease if current < previous

      :no_change
    end

    def sum(depth_set)
      return nil unless depth_set

      depth_set.sum
    end

    def read(filepath)
      File.open(filepath, chomp: true).map(&:to_i)
    end
  end
end
