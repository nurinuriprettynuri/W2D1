class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class NullPiece < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def moves
  end

  def symbol
  end
end