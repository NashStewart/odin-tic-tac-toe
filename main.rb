# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/board'

# puts 'Enter name for Player X'
# player_x_name = gets.chomp
# puts 'Enter name for Player O'
# player_o_name = gets.chomp

player_x_name = 'Bilbo'
player_o_name = 'Gandalf'
game = Game.new(player_x_name, player_o_name)
board = Board.new

turns_taken = 0
winner = nil
until winner || turns_taken == 9
  puts "\n#{board}"

  mark = game.whose_turn
  puts "Choose row for '#{mark}':"
  row = gets.chomp.to_i - 1
  puts "Choose column for '#{mark}':"
  column = gets.chomp.to_i - 1

  valid_input = board.mark_cell(row, column, mark)
  winner = mark if board.three_in_a_row?(mark)
  if valid_input
    game.end_turn
    turns_taken += 1
  end
end

puts "\n#{board}"

if winner == 'X'
  puts "#{game.player_x_name} wins!"
elsif winner == 'O'
  puts "#{game.player_o_name} wins!"
else
  puts 'Stalemate :('
end
