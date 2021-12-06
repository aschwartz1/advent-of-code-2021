class Day2
  def self.run(input)
    instructions = parse(input)

    navigate(instructions)
  end

  class << self
    private

    def parse(input)
      input.map do |line|
        split = line.split
        {split[0] => split[1].to_i}
      end
    end

    def navigate(instructions)
      start_position = {horizontal: 0, depth: 0}
      instructions.each_with_object(start_position) do |instruction, current_position|
        command = instruction.keys.first

        move(command, instruction, current_position)
      end
    end

    def move(command, instruction, current_position)
      case command
      when "forward"
        current_position[:horizontal] += instruction[command]
      when "up"
        current_position[:depth] -= instruction[command]
      when "down"
        current_position[:depth] += instruction[command]
      end
    end
  end
end
