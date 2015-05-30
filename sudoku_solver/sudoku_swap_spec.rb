require './sudoku_swap'

describe Sudoku do
    before :each do
        @matrix = Matrix[[1],[2]]
    end

    it "should initialise" do
        sudoku = Sudoku.new @matrix
    end
end
