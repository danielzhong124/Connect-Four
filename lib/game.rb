require 'colorize'

class Game
  WIDTH = 7.freeze
  HEIGHT = 6.freeze

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, ' ') }
  end

  def print_grid
    row_sep = '|---+---+---+---+---+---+---|'.colorize(:blue)
    col_sep = '|'.colorize(:blue)

    puts row_sep
    @grid.each do |row|
      puts "#{col_sep} #{row.join(" #{col_sep} ")} #{col_sep}"
      puts row_sep
    end
  end
end

#"\u25cf" = circle
