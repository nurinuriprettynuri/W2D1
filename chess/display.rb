require "colorize"
require_relative "cursor"
require_relative "board"

class Display

  attr_reader :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.rows.each do |row|
      display_row = ""
      row.each do |tile|
        display_row += tile.colorize( :background => :white)
      end
      p display_row
    end
  end

end

    # @board[@cursor.cursor_pos].colorize( :background => :yellow )
    # while true
    #   system("clear") 
    #   old_pos = @cursor.cursor_pos
    #   @cursor.get_input
    #   @board[old_pos].colorize( :background => :white )
    #   @board[@cursor.cursor_pos].colorize( :background => :yellow )
    # end