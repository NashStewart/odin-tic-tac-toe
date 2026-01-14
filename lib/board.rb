# frozen_string_literal: true

# Object representing a 9x9 game boad where Tic Tac Toe marks can be made.
class Board
  attr_reader :cells

  def initialize(cells = Array.new(3) { Array.new(3) })
    @cells = cells
  end

  def update_cell(row, column, player_mark)
    return nil unless row.between?(0, cells.first.size - 1)
    return nil unless column.between?(0, cells.size - 1) 
    return nil unless cells[row][column].nil?

    @cells[row][column] = player_mark
  end

  def three_in_a_row?(player_mark)
    (
      horizontal_match?(player_mark) ||
      vertical_match?(player_mark) ||
      slope_down_match?(player_mark) ||
      slope_up_match?(player_mark)
    )
  end

  def horizontal_match?(player_mark)
    cells.any? { |row| row.all?(player_mark) }
  end

  def vertical_match?(player_mark)
    (0..cells.size).each do |column|
      return true if cells.all? { |row| row[column] == player_mark }
    end

    false
  end

  def slope_down_match?(player_mark)
    downward_diagonal = cells.map.with_index { |_, i| cells[i][i] }
    downward_diagonal.all?(player_mark)
  end

  def slope_up_match?(player_mark)
    upward_diagonal = cells.map.with_index { |_, i| cells[i][-i - 1] }
    upward_diagonal.all?(player_mark)
  end
end
