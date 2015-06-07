require 'matrix'

class Matrix
    def []=(row, column, value)
        @rows[row][column] = value
    end
end

class Sudoku
    def initialize(matrix)
        @matrix= convert_to_positions(matrix)
    end

    def convert_to_positions(matrix)
        matrix.each_with_index do |e, row, col|
            matrix[row, col] = Position.new(row, col, e)
        end
    end

    def get_duplicate_cells
        dup_in_rows = []
        dup_in_cols = []
        9.times do |i|
            column = @matrix.column(i)
            row = @matrix.row(i)
            dup_in_cols += duplicates(column)
            dup_in_rows += duplicates(row)
        end
        return dup_in_rows.to_set & dup_in_cols.to_set
    end

    def duplicates(elems)
        elems.group_by{|r| r.val}.select{|k,v| v.size > 1}.values.flatten
    end
end
