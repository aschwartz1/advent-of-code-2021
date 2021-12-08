class Day2
  def initialize
    # TODO what?
  end

  def part_1(filepath)
    input = read_input(filepath)

    final_position = navigate(input)

    final_position[:horizontal] * final_position[:depth]
  end

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
