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

  class << self
    private

    def delta_for(previous, current)
      return :no_previous if previous.nil?
      return :increase if current > previous
      return :decrease if current < previous

      :no_change
    end
  end
end
