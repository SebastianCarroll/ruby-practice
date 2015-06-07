require './sudoku_swap'
require './position'

describe Sudoku do
    before :each do
        @matrix = Matrix[
            [5, 6, 2, 5, 7, 1, 9, 8, 3],
            [7, 9, 1, 2, 8, 3, 4, 6, 5],
            [5, 8, 3, 6, 4, 9, 2, 7, 1],
            [6, 1, 7, 4, 9, 8, 5, 3, 2],
            [9, 4, 8, 3, 4, 2, 6, 1, 7],
            [2, 3, 5, 1, 6, 7, 8, 9, 4],
            [1, 7, 6, 9, 2, 4, 3, 5, 8],
            [3, 5, 4, 8, 1, 6, 7, 2, 9],
            [8, 2, 9, 7, 3, 5, 1, 4, 6]]
        @sudoku = Sudoku.new @matrix
    end

    it "should recognize a correctly solved sudoku" do
        expect(@sudoku.correct?).to be false
        sudoku2 = Sudoku.new(Matrix[
            [4, 6, 2, 5, 7, 1, 9, 8, 3],
            [7, 9, 1, 2, 8, 3, 4, 6, 5],
            [5, 8, 3, 6, 4, 9, 2, 7, 1],
            [6, 1, 7, 4, 9, 8, 5, 3, 2],
            [9, 4, 8, 3, 5, 2, 6, 1, 7],
            [2, 3, 5, 1, 6, 7, 8, 9, 4],
            [1, 7, 6, 9, 2, 4, 3, 5, 8],
            [3, 5, 4, 8, 1, 6, 7, 2, 9],
            [8, 2, 9, 7, 3, 5, 1, 4, 6]])
        expect(sudoku2.correct?).to be true
    end

    it "should correctly identify the sections 0 - 8" do
        expect(@sudoku.get_section(0)).to eq(@matrix.minor(0..2, 0..2))
        expect(@sudoku.get_section(1)).to eq(@matrix.minor(0..2, 3..5))
        expect(@sudoku.get_section(2)).to eq(@matrix.minor(0..2, 6..8))

        expect(@sudoku.get_section(3)).to eq(@matrix.minor(3..5, 0..2))
        expect(@sudoku.get_section(4)).to eq(@matrix.minor(3..5, 3..5))
        expect(@sudoku.get_section(5)).to eq(@matrix.minor(3..5, 6..8))

        expect(@sudoku.get_section(6)).to eq(@matrix.minor(6..8, 0..2))
        expect(@sudoku.get_section(7)).to eq(@matrix.minor(6..8, 3..5))
        expect(@sudoku.get_section(8)).to eq(@matrix.minor(6..8, 6..8))
    end
end
