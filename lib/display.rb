# frozen_string_literal: true

class Display
  def display(board_cells, player_name)
    puts <<~HEREDOC
      clear
      * * * * * * * * * * * * *
      *  #{board_cells[0][0]}  |  #{board_cells[0][1]}  |  #{board_cells[0][2]}
      *-----+-----+-----
      *  #{board_cells[1][0]}  |  #{board_cells[1][1]}  |  #{board_cells[1][2]}
      *-----+-----+-----
      *  #{board_cells[2][0]}  |  #{board_cells[2][1]}  |  #{board_cells[2][2]}
      *
      *  #{player_name}'s turn
      * * * * * * * * * * * * *
    HEREDOC
  end
end
