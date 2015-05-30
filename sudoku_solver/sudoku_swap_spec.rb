require './sudoku_swap'
require './position'

describe Sudoku do
    before :each do
        @matrix = Matrix[[
            [4, 6, 2, 5, 7, 1, 9, 8, 3],
            [7, 9, 1, 2, 8, 3, 4, 6, 5],
            [5, 8, 3, 6, 4, 9, 2, 7, 1],
            [6, 1, 7, 4, 9, 8, 5, 3, 2],
            [9, 4, 8, 3, 5, 2, 6, 1, 7],
            [2, 3, 5, 1, 6, 7, 8, 9, 4],
            [1, 7, 6, 9, 2, 4, 3, 5, 8],
            [3, 5, 4, 8, 1, 6, 7, 2, 9],
            [8, 2, 9, 7, 3, 5, 1, 4, 6]]]
    end

    it "should initialise" do
        sudoku = Sudoku.new @matrix
    end
end
