require 'matrix'

class Sudoku
    def initialize(matrix)
        @matrix= matrix
    end

    def sum_cols_and_rows
        col_sum = []*9
        row_sum = []*9
        0.upto(8).each do |i|
            col_sum << @matrix.column(i).reduce(:+)
            row_sum << @matrix.row(i).reduce(:+)
        end
    end
end
