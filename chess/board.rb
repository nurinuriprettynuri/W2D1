require_relative "piece.rb"

class Board
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece
  end

  def render
  end

  def [](pos)
    a, b = pos
    @rows[a][b]
  end

  def []=(pos, val)
    a, b = pos
    @rows[a][b] = val
  end

  def move_piece(start_pos, end_pos)
    if !valid_pos?(start_pos)
      raise "Start position #{start_pos} is not valid."
    end
    if !valid_pos?(end_pos)
      raise "End position #{end_pos} is not valid."
    end
    if self[start_pos].nil?
      raise "Nothing is at #{start_pos}."
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = @sentinel
  end

  def valid_pos?(pos)
    a, b = pos
    (a <= 8 && a >= 0) && (b <= 8 && b >= 0)
  end
end 