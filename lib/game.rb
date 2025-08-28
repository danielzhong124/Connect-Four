# frozen_string_literal: true

require_relative 'player'

class Game
  def initialize
    @grid = Array.new(6) { Array.new(7, ' ') }
    @players = [Player.new(:red), Player.new(:yellow)]
    @curr_player_num = rand(2)
  end

  def play
    while @grid[0].any? { |space| space == ' ' }
      system 'cls'
      print_grid

      place_player_disc
      switch_player!
    end
  end

  def curr_player
    @players[@curr_player_num]
  end

  def switch_player!
    @curr_player_num = 1 - @curr_player_num
  end

  def place_player_disc
    puts "#{curr_player.name}'s turn."

    col = curr_player.choose_col
    until @grid[0][col] == ' '
      puts 'That column is already full. Try again.'
      col = curr_player.choose_col
    end

    drop_disc(col)
  end

  def drop_disc(col)
    row = -1
    row -= 1 until @grid[row][col] == ' '
    @grid[row][col] = curr_player.disc

    [row, col]
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
