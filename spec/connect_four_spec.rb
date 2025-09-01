# frozen_string_literal: true

require_relative '../lib/connect_four'
require 'colorize'

describe ConnectFour do
  describe '#drop_disc' do
    it "drops the current player's disc into the given column" do
      test = ConnectFour.new
      expect(test.drop_disc(0)).to eql([0, 0])
      expect(test.drop_disc(0)).to eql([1, 0])
      expect(test.grid[1][0]).to eql(test.curr_player.disc)
    end
  end

  describe '#four_in_row?' do
    context 'when checking for vertical connect 4' do
      it "returns whether there is connect 4" do
        test = ConnectFour.new
        test.grid[1][4] = test.curr_player.disc
        test.grid[2][4] = test.curr_player.disc
        test.grid[3][4] = test.curr_player.disc
        expect(test.four_in_row?(3, 4)).to eql(false)
        
        test.grid[4][4] = test.curr_player.disc 
        expect(test.four_in_row?(4, 4)).to eql(true)
      end
    end

    context 'when checking for horizontal connect 4' do
      it "returns whether there is connect 4" do
        test = ConnectFour.new
        test.grid[4][2] = test.curr_player.disc
        test.grid[4][3] = test.curr_player.disc
        test.grid[4][5] = test.curr_player.disc
        expect(test.four_in_row?(4, 3)).to eql(false)
        
        test.grid[4][4] = test.curr_player.disc 
        expect(test.four_in_row?(4, 3)).to eql(true)
      end
    end

    context 'when checking for diagonal connect 4' do
      it "returns whether there is connect 4" do
        test = ConnectFour.new
        test.grid[2][2] = test.curr_player.disc
        test.grid[3][3] = test.curr_player.disc
        test.grid[5][5] = test.curr_player.disc
        expect(test.four_in_row?(2, 2)).to eql(false)
        
        test.grid[4][4] = test.curr_player.disc 
        expect(test.four_in_row?(2, 2)).to eql(true)
      end
    end    
  end
end
