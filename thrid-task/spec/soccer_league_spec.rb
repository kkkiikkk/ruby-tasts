# frozen_string_literal: true

require_relative '../soccer_league'

# Mock data
game_string_mock = 'Lions 3, Snakes 3'
game_arr_draw = [%w[Lions 3], %w[Snakes 3]]
game_arr_win = [%w[Lions 2], %w[Snakes 3]]
game_arr_lose = [%w[Lions 3], %w[Snakes 2]]

describe 'Soccer League' do
  describe 'parse string game to array' do
    context "given '#{game_string_mock}'" do
      it 'returns array of two elements each consisting of two elements, first is a team name, second is a score' do
        game = parse_string_games_to_array(game_string_mock)
        expect(game.size).to eq(2)
        expect(game[0].size).to eq(2)
        expect(game[1].size).to eq(2)
        expect(game).to eq(game_arr_draw)
      end
    end
  end

  describe 'generate stats' do
    context 'generate stats by the provided game' do
      context "given '#{game_arr_draw}'" do
        it 'returns hash that has only two keys' do
          stats = generate_stats([game_arr_draw])
          expect(stats['Lions']).to eq(1)
          expect(stats['Snakes']).to eq(1)
        end
      end

      context "given a winning game '#{game_arr_win}'" do
        it 'returns hash with correct points allocation' do
          stats = generate_stats([game_arr_win])
          expect(stats['Lions']).to eq(0)
          expect(stats['Snakes']).to eq(3)
        end
      end

      context "given a losing game '#{game_arr_lose}'" do
        it 'returns hash with correct points allocation' do
          stats = generate_stats([game_arr_lose])
          expect(stats['Lions']).to eq(3)
          expect(stats['Snakes']).to eq(0)
        end
      end

      context 'given multiple games' do
        it 'aggregates the stats correctly' do
          games = [game_arr_draw, game_arr_win, game_arr_lose]
          stats = generate_stats(games)
          expect(stats['Lions']).to eq(4)
          expect(stats['Snakes']).to eq(4)
        end
      end
    end
  end

  describe 'display stats' do
    it 'displays the stats in the correct format' do
      stats = { 'Lions' => 4, 'Snakes' => 4 }
      expect { display_stats(stats) }.to output("1. Lions, 4 pts\n2. Snakes, 4 pts\n").to_stdout
    end
  end
end
