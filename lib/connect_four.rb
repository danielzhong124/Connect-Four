# frozen_string_literal: true

require_relative 'player'

class ConnectFour
  WIDTH = 7
  HEIGHT = 6

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, ' ') }
    @players = [Player.new(:red), Player.new(:yellow)]
    @curr_player_num = rand(2)
  end

  def play
    winner = nil
    until winner || grid_full?
      system 'cls'

      row, col = drop_player_disc
      winner = curr_player if four_in_row?(row, col)

      switch_player!
    end

    system 'cls'
    print_grid
    puts(winner.nil? ? "It's a draw." : "#{winner.name} wins!")
  end

  def grid_full?
    @grid[-1].none? { |space| space == ' ' }
  end

  def curr_player
    @players[@curr_player_num]
  end

  def switch_player!
    @curr_player_num = 1 - @curr_player_num
  end

  def drop_player_disc
    print_grid
    col = curr_player.choose_col(@grid)

    row = 0
    row += 1 until @grid[row][col] == ' '
    @grid[row][col] = curr_player.disc

    [row, col]
  end

  def four_in_row?(row, col)
    # vertical
    return true if count_connects(row, col, [0, -1]) >= 3

    # horizontal
    return true if count_connects(row, col, [-1, 0]) + count_connects(row, col, [1, 0]) >= 3

    # diagonal
    return true if count_connects(row, col, [-1, -1]) + count_connects(row, col, [1, 1]) >= 3
    return true if count_connects(row, col, [-1, 1]) + count_connects(row, col, [1, -1]) >= 3

    false
  end

  def count_connects(row, col, dir, connects = 0)
    return connects if connects >= 3

    row += dir[1]
    col += dir[0]

    return connects unless row.between?(0, HEIGHT - 1) && col.between?(0, WIDTH - 1)
    return connects unless @grid[row][col] == curr_player.disc

    count_connects(row, col, dir, connects + 1)
  end

  def print_grid
    row_sep = "\n|---+---+---+---+---+---+---|\n".colorize(:blue)
    col_sep = ' | '.colorize(:blue)

    grid_str = String.new
    @grid.each { |row| grid_str.prepend('| '.colorize(:blue), row.join(col_sep), ' |'.colorize(:blue), row_sep) }

    puts grid_str.prepend(row_sep)
  end

  private :count_connects, :curr_player, :switch_player
end
