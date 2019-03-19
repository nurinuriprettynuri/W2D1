require "byebug"
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
    while true
      system("clear")
      a, b = @cursor.cursor_pos

      @board.rows.each_with_index do |row, row_i|
        display_row = ""
        row.each_with_index do |tile, tile_i|
          if row_i == a && tile_i == b
                display_row += tile.colorize(:background => :blue)
          elsif (row_i + tile_i).even?
            display_row += tile.colorize(:background => :white)
          else
            display_row += tile.colorize(:background => :black)
          end
        end
        puts display_row
      end

      @cursor.get_input

    end
  end
end

game = Display.new
game.render