class Day2
  def self.run(input)
    instructions = parse(input)
    totals = {horizontal: 0, depth: 0}

    instructions.each do |movement|
      command = movement.keys.first

      case command
      when "forward"
        totals[:horizontal] += movement[command]
      when "up"
        totals[:depth] -= movement[command]
      when "down"
        totals[:depth] += movement[command]
      end
    end

    totals
  end

  class << self
    private

    def parse(input)
      input.map do |line|
        split = line.split
        {split[0] => split[1].to_i}
      end
    end
  end
end
