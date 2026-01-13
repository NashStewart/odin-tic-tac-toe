# frozen_string_literal: true

# Object representing a 9x9 game boad where Tic Tac Toe marks can be made.
class Board
  attr_reader :cells

  def initialize(cells = Array.new(3) { Array.new(3) })
    @cells = cells
  end

  def update_cell(row, column, mark)
    return nil if row.negative? || row >= cells.size
    return nil if column.negative? || column >= cells[row].size
    return nil unless cells[row][column].nil?
    return nil unless %w[X O].include?(mark)

    @cells[row][column] = mark
  end

  def three_in_a_row?(mark)
    horizontal_match?(mark) || vertical_match?(mark) || slope_down_match?(mark) || slope_up_match?(mark)
  end

  def to_s
    row_divider = '----+-----+----'
    "#{row_string(0)}\n#{row_divider}\n#{row_string(1)}\n#{row_divider}\n#{row_string(2)}"
  end

  private

  def horizontal_match?(mark)
    cells.any? { |row| row.all? mark }
  end

  def vertical_match?(mark)
    (0..cells.first.size).each do |column|
      return true if cells.all? { |row| row[column] == mark }
    end
    false
  end

  def slope_down_match?(mark)
    cells.each_with_index { |_, i| return false unless cells[i][i] == mark }
    true
  end

  def slope_up_match?(mark)
    cells.each_with_index { |_, i| return false unless cells[i][-i - 1] == mark }
    true
  end

  def row_string(row_index)
    cells[row_index].map { |cell| cell ? " #{cell} " : '   ' }.join(' | ')
  end
end
