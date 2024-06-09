# frozen_string_literal: true

class Game
  attr_accessor :player_one_name, :player_two_name
  attr_reader :whose_turn

  def initialize(player_one_name, player_two_name)
    self.player_one_name = player_one_name
    self.player_two_name = player_two_name
    @whose_turn = 1
  end

  def end_turn
    if whose_turn == 1
      @whose_turn = 2
    else
      @whose_turn = 1
    end
    whose_turn
  end
end
