# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/victory_line'

game = Game.new('Bilbo', 'Gandalf')
puts game.player_one_name

puts game.whose_turn
puts game.end_turn
puts game.end_turn

first_column = VictoryLine.new
first_column.mark_position('X', 2)
p first_column.positions
first_column.mark_position('O', 1)
p first_column.positions
first_column.mark_position('X', 3)
p first_column.positions
first_column.mark_position('X', 0)
p first_column.positions
first_column.mark_position('X', -1)
p first_column.positions

