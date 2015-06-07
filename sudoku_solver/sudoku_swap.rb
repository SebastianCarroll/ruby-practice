require 'matrix'

class Matrix
    def []=(row, column, value)
        @rows[row][column] = value
    end
end

class Sudoku
    def initialize(matrix)
        @matrix= matrix
        @expected_row = Set.new (1..9)
    end

    def convert_to_positions(matrix)
        matrix.each_with_index do |e, row, col|
            matrix[row, col] = Position.new(row, col, e)
        end
    end

    def correct?
        ret = true
        9.times do |i|
            column = @matrix.column(i)
            row = @matrix.row(i)
            section = get_section(i).to_a.flatten
            unless all_numbers_in(column) && all_numbers_in(row) && all_numbers_in(section)
                ret=false
                break
            end
        end
        return ret
    end

    def all_numbers_in(row)
        common = row.to_set & @expected_row
        return common.length == 9
    end

    def get_section(i)
        x=(i/3)*3
        y=(i%3)*3
        return @matrix.minor(x, 3, y, 3)
    end
end
