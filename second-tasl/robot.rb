# frozen_string_literal: true

class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :x_pos, :y_pos, :current_direction_number

  def initialize(x_pos, y_pos, direction)
    @current_direction_number = DIRECTIONS.find_index(direction)
    @x_pos = x_pos
    @y_pos = y_pos
  end

  def move
    case @current_direction_number
    when 0
      @y_pos += 1
    when 2
      @y_pos -= 1
    when 1
      @x_pos += 1
    when 3
      @x_pos -= 1
    end
  end

  def turn(turn)
    new_direction_number = @current_direction_number + turn

    new_direction_number = 0 if new_direction_number > 3
    new_direction_number = 3 if new_direction_number.negative?

    @current_direction_number = new_direction_number
  end

  def to_s
    "#{@x_pos}, #{@y_pos}, #{Robot::DIRECTIONS[@current_direction_number]}"
  end
end

class App
  attr_writer :grid, :width, :height

  def initialize
    @width = 5
    @height = 6
    @grid = []
  end

  def run
    puts 'Welcome to robot movement simulation'

    puts 'Do you want to enter size of your grid ?'
    puts 'Input Y/press any other button to continue(program will generate grid 5x6 for you)'

    is_grid_generated = gets.chomp

    if is_grid_generated == 'Y'
      puts 'Enter width of your grid: '
      @width = gets.chomp.to_i

      puts 'Enter heigth of your grid: '
      @height = gets.chomp.to_i
    end

    generate_grid

    puts 'The grid was generated'

    robot_start_properties = []
    loop do
      start_place_input = gets.chomp.to_s
      next unless start_place_input.start_with?('PLACE')

      robot_start_properties_string = start_place_input.slice(6..start_place_input.size)
      robot_start_properties = if robot_start_properties_string && robot_start_properties_string.to_s.size > 4
                                 robot_start_properties_string.split(',')
                               else
                                 robot_start_properties_string
                               end

      unless Robot::DIRECTIONS.include?(robot_start_properties[0])
        puts 'The first argument of PLACE should be a direction'
        next
      end

      if !robot_start_properties[1] || !robot_start_properties[2]
        puts 'The 2nd and 3rd arguments should be a number that represent coordinates on the grid'
        next
      end

      if robot_start_properties[1].to_i.negative? ||
         robot_start_properties[1].to_i > @width ||
         robot_start_properties[2].to_i.negative? ||
         robot_start_properties[2].to_i > @height
        puts 'You are outside the grid'
        next
      end
      break
    end

    robot = Robot.new(robot_start_properties[1].to_i, robot_start_properties[2].to_i, robot_start_properties[0])

    puts 'Robot has been placed'

    loop do
      action = gets.chomp.to_s

      case action
      when 'RIGHT'
        robot.turn(1)
      when 'LEFT'
        robot.turn(-1)
      when 'MOVE'
        curr_x_pos = robot.x_pos
        curr_y_pos = robot.y_pos

        robot.move
        if robot.x_pos.negative? || robot.x_pos > @width || robot.y_pos.negative? || robot.y_pos > @height
          robot.x_pos = curr_x_pos
          robot.y_pos = curr_y_pos
          next
        end
      when 'REPORT'
        puts robot
      end
    end
  end

  private

  def generate_grid
    (0...@width).each do |i|
      @grid[i] = []
      @grid[i].fill(0, 0...@height)
    end
  end
end

app = App.new

app.run
