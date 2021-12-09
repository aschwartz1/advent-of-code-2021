class Day2
  def self.part_2(filepath)
    input = read_input(filepath)

    final_position = navigate(input)

    final_position[:horizontal] * final_position[:depth]
  end

  class << self
    private

    def read_input(filepath)
      File.open(filepath).map do |line|
        parse(line)
      end
    end

    def parse(input_line)
      split = input_line.split

      {split[0] => split[1].to_i}
    end

    def navigate(instructions)
      start_position = {horizontal: 0, depth: 0, aim: 0}
      instructions.each_with_object(start_position) do |instruction, current_position|
        command = instruction.keys.first

        move(command, instruction, current_position)
      end
    end

    def move(command, instruction, current_position)
      case command
      when "forward"
        current_position[:horizontal] += instruction[command]
        current_position[:depth] += current_position[:aim] * instruction[command]
      when "up"
        current_position[:aim] -= instruction[command]
      when "down"
        current_position[:aim] += instruction[command]
      end
    end
  end
end
