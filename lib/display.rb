# frozen_string_literal: true

class Display
  def initialize(board_cells)
    @board_cells = board_cells
  end

  def show_board
    puts("\n" * 50) 
    puts <<~HEREDOC
      ╔═══════════════════════════╗
      ║                           ║
      ║       1     2     3       ║
      ║    ┌─────────────────┐    ║
      ║  1 │  #{show_cell(0, 0)}  |  #{show_cell(0, 1)}  |  #{show_cell(0, 2)}  │    ║
      ║    │-----+-----+-----│    ║
      ║  2 │  #{show_cell(1, 0)}  |  #{show_cell(1, 1)}  |  #{show_cell(1, 2)}  │    ║
      ║    │-----+-----+-----│    ║
      ║  3 │  #{show_cell(2, 0)}  |  #{show_cell(2, 1)}  |  #{show_cell(2, 2)}  │    ║
      ║    └─────────────────┘    ║
      ║                           ║
      ╚═══════════════════════════╝
    HEREDOC
  end

  def prompt_for_player_name(player_mark)
    puts("\n" * 50) 
    puts <<~HEREDOC
      ╔═══════════════════════════╗
      ║                           ║
      ║                           ║
      ║                           ║
      ║                           ║
      ║                           ║
      ║  Enter name for Player #{player_mark}  ║
      ║                           ║
      ║                           ║
      ║                           ║
      ║                           ║
      ╚═══════════════════════════╝
    HEREDOC
  end

  def show_cell(row, column)
    cell = @board_cells[row][column]
    cell.nil? ? ' ' : cell.colorize(:green)
  end
end
