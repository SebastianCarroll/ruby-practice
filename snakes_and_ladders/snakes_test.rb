require "minitest/autorun"
require_relative "board"

describe Board do
  before do
  end

  describe "basic test with no ladders" do
    it "should take all 6 rolls" do
      snakes,ladders = []
      board = Board.new(snakes,ladders)
      actual =  board.fastest
      expected = ([6]*16) << 3
      actual.must_equal expected
    end
  end
end
