class Day2
  def self.run(input)
    instructions = parse(input)

    instructions.each_with_object({horizontal: 0, depth: 0}) do |movement, memo|
      command = movement.keys.first

      case command
      when "forward"
        memo[:horizontal] += movement[command]
      when "up"
        memo[:depth] -= movement[command]
      when "down"
        memo[:depth] += movement[command]
      end
    end
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
