# frozen_string_literal: true

# Object representing a game of Tic Tac Toe
class Game
  attr_reader :current_player_mark, :current_player_name

  def initialize
    @player_x_name = 'X'
    @player_o_name = 'O'
    @current_player_mark = 'X'
  end

  def prompt_for_player_names
    puts 'Enter name for Player X'
    @player_x_name = gets.chomp
    puts "\nEnter name for Player O"
    @player_o_name = gets.chomp
    @current_player_name = @player_x_name
  end

  def get_player_name(mark)
    if mark == 'X'
      @player_x_name
    elsif mark == 'O'
      @player_o_name
    end
  end

  def end_turn
    if current_player_mark == 'X'
      @current_player_name = @player_o_name
      @current_player_mark = 'O'
    else
      @current_player_name = @player_x_name
      @current_player_mark = 'X'
    end
  end
end
