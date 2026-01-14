# frozen_string_literal: true

require 'colorize'

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/display'

# Object representing a game of Tic Tac Toe
class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board.cells)
    @player_x = new_player('X')
    @player_o = new_player('O')
    @current_player = @player_x
  end

  def play
    turns_taken = 0
    winner = false

    @display.show_board
    
    until winner || turns_taken == 9
      puts "\n#{@current_player.name}'s turn".colorize(:yellow)
      
      puts 'Choose a row:'
      row = gets.chomp.to_i - 1

      puts 'Choose a column:'
      column = gets.chomp.to_i - 1

      valid_input = @board.update_cell(row, column, @current_player.mark)
      winner = @current_player.name if @board.three_in_a_row?(@current_player.mark)

      if valid_input
        update_player_turn
        turns_taken += 1
      end

      @display.show_board
    end

    if winner
      puts "\n#{winner} wins!\n".colorize(:green)
    else
      puts "\nStalemate :(\n".colorize(:red)
    end
  end

  def new_player(player_mark)
    @display.prompt_for_player_name(player_mark)
    puts
    player_name = gets.chomp
    Player.new(player_name, player_mark)
  end

  def update_player_turn 
    @current_player = @current_player == @player_x ? @player_o : @player_x
  end
end
