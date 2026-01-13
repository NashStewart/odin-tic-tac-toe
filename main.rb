# frozen_string_literal: true

require 'colorize'

require_relative 'lib/game'
require_relative 'lib/board'

game = Game.new
board = Board.new

game.prompt_for_player_names

puts "\n" * 50
turn_divider = '* ' * 9
puts "\n#{turn_divider.colorize(:magenta)}"
puts "\n#{board}".colorize(:cyan)

turns_taken = 0
winner = nil
until winner || turns_taken == 9
  player = game.current_player_name
  mark = game.current_player_mark

  puts "\n#{game.current_player_name}'s turn".colorize(:yellow)
  puts 'Choose a row:'
  row = gets.chomp.to_i - 1

  puts 'Choose a column:'
  column = gets.chomp.to_i - 1

  valid_input = board.update_cell(row, column, mark)
  winner = player if board.three_in_a_row?(mark)

  if valid_input
    game.end_turn
    turns_taken += 1
  end

  puts "\n" * 50
  puts turn_divider.colorize(:magenta)
  puts "\n#{board}".colorize(:cyan)
end

if winner
  puts "\n#{winner} wins!\n".colorize(:green)
else
  puts "\nStalemate :(\n".colorize(:red)
end
