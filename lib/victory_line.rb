class VictoryLine
  attr_reader :positions
  
  def initialize
    @positions = Array.new 3
  end

  def mark_position(mark, index)
    @positions[index] ||= mark if index >= 0 && index < positions.size
  end
end
