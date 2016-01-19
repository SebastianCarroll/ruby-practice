require "minitest/autorun"
require 'pry'
require 'pry-nav'
require_relative "2d_array"

describe Array2D do
  before do
  end

  it "should find single answer for 3x3 square" do
    input = [[1,1,1],[0,1,1], [1,1,1]]
    highest = Array2D.new(input).find_highest_hourglass
    highest.must_equal 7
  end
end
