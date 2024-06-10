# frozen_string_literal: true

# Object representing a game of Tic Tac Toe
class Game
  attr_accessor :player_x_name, :player_o_name
  attr_reader :whose_turn

  def initialize(player_x_name, player_o_name)
    self.player_x_name = player_x_name
    self.player_o_name = player_o_name
    @whose_turn = 'X'
  end

  def end_turn
    @whose_turn = if whose_turn == 'X'
                    'O'
                  else
                    'X'
                  end
    whose_turn
  end
end
