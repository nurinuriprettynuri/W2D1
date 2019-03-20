module Slideable
  HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
  DIAGONAL_DIRS = [[-1,-1],[1,1],[-1,1],[1,-1]]

  def horizontal_dirs
    all_possible_horizontal_moves = []
    HORIZONTAL_DIRS.each do |dir|
      a = @pos[0] + dir[0]
      b = @pos[1] + dir[1]
      until !@board.valid_pos?([a,b]) && @board[a][b] == NULLPIECE
        all_possible_horizontal_moves << [a,b]
        a += dir[0]
        b += dir[1]
      end
      if @board[a][b].color == @color
        all_possible_diagonal_moves << [a,b]
      end
    end

    all_possible_horizontal_moves
  end

  def diagonal_dirs
    all_possible_diagonal_moves = []
    DIAGONAL_DIRS.each do |dir|
      a = @pos[0] + dir[0]
      b = @pos[1] + dir[1]
      while @board.valid_pos?([a,b]) && @board[a][b] == NULLPIECE
        all_possible_diagonal_moves << [a,b]
        a += dir[0]
        b += dir[1]
      end
      if @board[a][b].color == @color
        all_possible_diagonal_moves << [a,b]
      end
    end

    all_possible_diagonal_moves
  end

  def moves
    all_possible_moves = move_dirs
    p all_possible_moves
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

  def grow_inblocked_moves_in_dir(dx, dy)

  end

end

