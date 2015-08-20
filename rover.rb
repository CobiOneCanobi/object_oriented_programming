class Rover

  attr_accessor :x, :y, :direction

  def initialize(position)
    @x = position[0].to_i
    @y = position[1].to_i
    @direction = position[2].upcase
  end

  def read_instruction(instructions)
    instructions.each do |instruction|
      if instruction == "M"
        move
      elsif instruction == "L" || instruction == "R"
       turn(instruction)
      end
    end
  end

  def move
    case @direction
    when "N"
      if @y != $plateau[1]
        @y += 1
      end
    when "S"
      if @y != 0
        @y -= 1
      end
    when "E"
      if @x != $plateau[0]
        @x += 1
      end
    when "W"
      if @x != 0
        @x -= 1
      end
    else
      puts "You have entered an invalid move so the rover cannot move in that direction"
    end
  end

  def turn(instruction)
    case instruction
    when "L"
      if @direction == "N"
        @direction = "W"

      elsif @direction == "S"
        @direction = "E"

      elsif @direction == "E"
        @direction = "N"

      elsif @direction == "W"
        @direction = "S"
      end
    when "R"
      if @direction == "N"
        @direction = "E"

      elsif @direction == "S"
        @direction = "W"

      elsif @direction == "E"
        @direction = "S"

      elsif @direction == "W"
        @direction = "N"
      end
    end
  end
end

puts "Please input an x and y coordinate for the plateau size"
$plateau = gets.chomp.split(" ")
$plateau.map!{|crrd| crrd.to_i}

puts "Please input the initial start position and direction of rover 1 (remember it has to be in the plateau parameters)"
posStart1 = gets.chomp.split(" ")
rover1 = Rover.new(posStart1)

puts "What move and turn instructions do you want to give to the rover 1"
instructions1 = gets.chomp.split("")
rover1.read_instruction(instructions1)

puts "Please input the initial start position and direction of rover 2 (remember it has to be in the plateau parameters)"
posStart2 = gets.chomp.split(" ")
rover2 = Rover.new(posStart2)

puts "What move and turn instructions do you want to give to the rover 2"
instructions2 = gets.chomp.split("")
rover2.read_instruction(instructions2)

puts "#{rover1.x} #{rover1.y} #{rover1.direction}"
puts "#{rover2.x} #{rover2.y} #{rover2.direction}"





