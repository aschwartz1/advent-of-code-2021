class Day1
  def self.run(input)
    previous_depth = nil
    current_depth = nil

    res = []
    input.each do |depth|
      current_depth = depth

      res << {depth.to_s => delta_text_for(previous_depth, current_depth)}

      previous_depth = current_depth
    end

    res
  end

  class << self
    private

    def delta_text_for(previous, current)
      return no_previous_text if previous.nil?
      return increase_text if current > previous
      return decrease_text if current < previous

      no_change_text
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
  end
end
