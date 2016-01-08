require "minitest/autorun"
require 'pry'
require 'pry-nav'
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

    it "should select links and moves in the next 6 steps" do
      ladders = [[1,2],[3,4]]
      snakes = [[5,6],[7,8]]
      vicinity = Board.new(snakes,ladders).get_moves
      vicinity.must_equal [2,4,4,6,6,8]
    end

    it "should take a ladder when only one exists" do
      ladders = [[2,99]]
      snakes = []
      moves = Board.new(snakes,ladders).fastest
      moves.must_equal 2
    end

    it "should take the best ladders available  " do
      ladders = [[12,80], [81,99], [5, 20]]
      snakes = []
      moves = Board.new(snakes,ladders).fastest
      moves.must_equal 4
    end

    it "should avoid snakes" do
      ladders = [[12,80], [82,99], [5, 20]]
      snakes = [[81, 10]]
      moves = Board.new(snakes,ladders).fastest
      moves.must_equal 4
    end

    it "should take good snakes" do
      ladders = [[12,80], [51,99], [5, 30]]
      snakes = [[81, 50]]
      moves = Board.new(snakes,ladders).fastest
      moves.must_equal 5
    end

    # Tests for bug where agent was moving to position > 100
    it "should ignore all links < 7 moves from goal" do
      ladders = [[12,80], [81,98], [5, 30]]
      snakes = [[99, 50]]
      moves = Board.new(snakes,ladders).fastest
      moves.must_equal 4
    end
  end
end
