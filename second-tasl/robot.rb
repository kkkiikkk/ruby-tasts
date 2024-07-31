class Robot 
  DIRECTIONS=["SOUTH", "EAST", "NORTH", "WEST"]

  attr_accessor :x_pos, :y_pos, :current_direction_number
  def initialize()
    @current_direction_number = 3
    @x_pos = 0
    @y_pos = 0
  end

  def move
    case @current_direction_number
    when 1
      @y_pos += 1
    when 3
      @y_pos -= 1
    when 2
      @x_pos -= 1
    when 0 
      @x_pos += 1
    end
  end

  def turn(turn)
    new_direction_number = @current_direction_number + turn
    
    new_direction_number = 0 if (new_direction_number > 3)
    new_direction_number = 3 if (new_direction_number < 0)

    @current_direction_number = new_direction_number

  end

  def to_s
    "#{@x_pos}, #{@y_pos}, #{Robot::DIRECTIONS[@current_direction_number]}"
  end

end

class App 
  attr_writer :grid, :width, :height

  def initialize()
    @width = 5
    @height = 6
    @grid = []
  end
  
  def run 
    puts "Welcome to robot movement simulation"

    puts "Do you want to enter size of your grid ?"
    puts "Input Y/press any other button to continue(program will generate grid 5x6 for you)"

    is_grid_generated = gets.chomp

    if (is_grid_generated === "Y")
      puts "Enter width of your grid: "
      @width = gets.chomp.to_i

      puts "Enter heigth of your grid: "
      @height = gets.chomp.to_i
    end

    generate_grid

    puts "The grid was generated"

    start_place_input = gets.chomp.to_s
    space_index = start_place_input.index(/\s/)
    if (space)
  end

  private

  def generate_grid
    (0...@width).each do |i|
      @grid[i] = [];
      @grid[i].fill(0, 0...@height)
    end
  end
end

# robot = Robot.new
# t
# robot.move

# robot.turn(1)
# robot.move
# robot.move

# robot.turn(1)
# robot.move
# robot.turn(1)
# robot.move
# robot.turn(1)
# robot.move

# p robot.to_s

app = App.new

app.run