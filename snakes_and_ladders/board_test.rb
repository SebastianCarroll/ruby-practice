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

    it "should select links in the next 6 steps" do
      ladders = [[1,2],[3,4]]
      snakes = [[5,6],[7,8]]
      vicinity = Board.new(snakes,ladders).get_next_links
      snakes << ladders[1]
        vicinity[3].must_equal 4
        vicinity[5].must_equal 6
        vicinity[7].must_equal 8
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
  end
end
