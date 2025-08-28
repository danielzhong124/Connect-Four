# frozen_string_literal: true

class Player
  attr_reader :name, :disc

  def initialize(color)
    @name = color.to_s.capitalize.colorize(color)
    @disc = "\u25cf".colorize(color)
  end

  def choose_col
    print 'Choose a column to drop your next disc (1-7): '
    col = gets.to_i
    until col.between?(1, 7)
      puts 'Invalid move. Try again.'
      print 'Choose a column to drop your next disc (1-7): '
      col = gets.to_i
    end

    col - 1
  end
end
