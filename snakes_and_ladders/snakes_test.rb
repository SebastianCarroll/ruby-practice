require "minitest/autorun"
require_relative "board"

describe Board do
  before do
  end

  describe "basic test with no ladders" do
    it "should take all 6 rolls" do
      snakes,ladders = [], []
      board = Board.new(snakes,ladders)
      actual =  board.fastest
      expected = 17
      actual.must_equal expected
    end
  end

  describe "full board" do
    it "should populate a list of links from snakes and ladders input correctly" do
      ladders = [[1,2],[3,4]]
      snakes = [[5,6],[7,8]]
      board = Board.new(snakes,ladders)
      ladders.each do |s,e|
        board.links[s].must_equal e
      end
    end
  end
end
