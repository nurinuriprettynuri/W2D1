require

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    return []
  end
end

class NullPiece < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
  end
end