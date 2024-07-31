# frozen_string_literal: true

def parse_string_games_to_array(game_string)
  game_arr = game_string.split(',')
  game_arr.each_with_index do |item, index|
    last_index = item.length - 1
    name = item[0...last_index - 1]
    game_arr[index] = [name.strip, item[last_index]]
  end
  game_arr
end

def generate_stats(parsed_games)
  stats = {}
  parsed_games.each do |game|
    stats[game[0][0]] = 0 unless stats.key?(game[0][0])
    stats[game[1][0]] = 0 unless stats.key?(game[1][0])

    if game[0][1].to_i == game[1][1].to_i
      stats[game[0][0]] += 1
      stats[game[1][0]] += 1
      next
    end

    if game[0][1].to_i < game[1][1].to_i
      stats[game[1][0]] += 3
    else
      stats[game[0][0]] += 3
    end
  end

  stats
end

def display_stats(stats)
  stats.each_with_index do |value, index|
    puts "#{index + 1}. #{value[0]}, #{value[1]} #{value[1] == 1 ? 'pt' : 'pts'}"
  end
end

def main
  games = []
  puts 'Welcome to soccer league app'
  puts 'Enter ur games, format of the input game - Team points, Team points'
  puts 'Enter end when you will finish'
  loop do
    game = gets.chomp.to_s
    break if game == 'end'

    games.push(parse_string_games_to_array(game))
  end

  generated_stats = generate_stats(games)
  sorted_generated_stats = generated_stats.sort_by { |k, value| [-value, k] }

  display_stats(sorted_generated_stats)
end
