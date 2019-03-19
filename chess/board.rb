require_relative "piece"

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.new("blank", self, [])
    self.render
  end

  def render
    @rows.each_with_index do |row, i_row|
      row.each_with_index do |tile, i_col|
        if i_row >= 2 && i_row <=5
          self[[i_row, i_col]] = "   "
        elsif i_row < 2
          self[[i_row, i_col]] = " w " #Piece.new("White", self, [i_row, i_col])
        else
          self[[i_row, i_col]] = " b " #Piece.new("Black", self, [i_row, i_col])
        end

      end
    end
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
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    a, b = pos
    (a <= 8 && a >= 0) && (b <= 8 && b >= 0)
  end
end 