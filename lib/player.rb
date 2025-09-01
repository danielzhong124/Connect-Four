# frozen_string_literal: true

class Player
  attr_reader :name, :disc

  def initialize(color)
    @name = color.to_s.capitalize.colorize(color)
    @disc = "\u25cf".colorize(color)
  end

  def select_col(grid)
    print "#{@name} enter column (1-#{ConnectFour::WIDTH}): "
    col = gets.to_i - 1
    until col.between?(0, ConnectFour::WIDTH) && grid[-1][col] == ' '
      puts 'Invalid move. Try again.'
      print "#{@name} enter column (1-#{ConnectFour::WIDTH}): "
      col = gets.to_i - 1
    end

    col
  end
end
