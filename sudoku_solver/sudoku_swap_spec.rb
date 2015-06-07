require './sudoku_swap'
require './position'

describe Sudoku do
    before :each do
        @matrix = Matrix[
            [4, 6, 2, 5, 7, 1, 9, 8, 3],
            [7, 4, 1, 2, 8, 3, 4, 6, 5],
            [5, 8, 3, 6, 4, 9, 2, 7, 1],
            [6, 1, 7, 4, 9, 8, 5, 3, 2],
            [9, 4, 8, 3, 5, 2, 6, 1, 7],
            [2, 3, 5, 1, 6, 7, 8, 9, 4],
            [1, 7, 6, 9, 2, 4, 3, 5, 8],
            [3, 5, 4, 8, 1, 6, 7, 2, 9],
            [8, 2, 9, 7, 3, 5, 1, 4, 6]]
    end

    it "should initialise" do
        sudoku = Sudoku.new @matrix
    end

    it "should find overlapping duplicate values" do
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
        sudoku = Sudoku.new @matrix
        dup_cells = []
        dup_cells << Position.new(0,0,5)
        dup_cells << Position.new(4,4,4)
        expect(sudoku.get_duplicate_cells).to match_array(dup_cells)
    end

    it "should find duplicates in a column" do
        sudoku = Sudoku.new @matrix
        i = 0
        col = [Position.new(0, i, 2),
               Position.new(1, i, 3),
               Position.new(2, i, 2)]
        expected_dups = col.select{|pos| pos.val == 2}
        actual_dups = sudoku.duplicates(col)
        expect(actual_dups).to match_array(expected_dups)
    end

    it "should find duplicates in a row" do
        sudoku = Sudoku.new @matrix
        i = 0
        row = [Position.new(i, 0, 5),
               Position.new(i, 1, 3),
               Position.new(i, 2, 3),
               Position.new(i, 3, 2)]
        expected_dups = row.select{|pos| pos.val == 3 }
        actual_dups = sudoku.duplicates(row)
        expect(actual_dups).to match_array(expected_dups)
    end
end
