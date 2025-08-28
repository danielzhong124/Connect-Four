require 'colorize'

class Game
  def initialize
    @grid = Array.new(6) { Array.new(7, ' ') }
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
