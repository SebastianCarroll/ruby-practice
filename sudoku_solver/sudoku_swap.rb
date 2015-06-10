require 'matrix'

class Matrix
    def []=(row, column, value)
        @rows[row][column] = value
    end
end

class Sudoku
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

    def solve
        nil_cells = @matrix.each_with_index.select{|v,r,c| v.nil? }
        nil_cells.each do |v,r,c|
            options = @options[r][c]
            if options.length == 0
                @options[r][c] = @expected_row
            elsif options.length == 1
                @matrix[r,c] = options.to_a[0]
                next
            end
            col = @matrix.column(c).to_set
            row = @matrix.row(r).to_set
            option = @options[r][c] - col - row
            if option.length == 1
                @matrix[r,c] = option.to_a[0]
            else
                @options[r][c] = option
            end
        end
        #@matrix.row_vectors.each_with_index do |row, r|
        #    diff = @expected_row - row.to_set
        #    row = row.each_with_index do |val,c|
        #        if val.nil?
        #            if diff.size == 1
        #                @matrix[r,c] = diff.to_a[0]
        #            else
        #                @options[r][c] = diff if val.nil?
        #            end
        #        end
        #    end
        #end
    end
end
