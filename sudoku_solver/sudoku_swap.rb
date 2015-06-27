require 'matrix'

class Matrix
    def []=(row, column, value)
        @rows[row][column] = value
    end
end

class Sudoku
    attr_accessor :matrix

    def initialize(matrix)
        @matrix= matrix
        @options= Array.new(9) { Array.new(9) {Set.new} }
        @expected_row = Set.new (1..9)
    end

    def [](row, col)
        @matrix[row, col]
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

    def init_options_cell(r,c)
        options = @options[r][c]
        @options[r][c] = @expected_row if options.length == 0
    end

    def solve
        nil_cells = @matrix.each_with_index.select{|v,r,c| v.nil?}
        nil_cells.each do |v,r,c|
            init_options_cell r,c
            col = @matrix.column(c).to_set
            row = @matrix.row(r).to_set
            free = @options[r][c] - col - row
            if free.length == 1
                @matrix[r,c] = free.to_a[0]
            else
                @options[r][c] = free
            end
        end
    end

    def ==(other)
        @matrix == other.matrix
    end
end
