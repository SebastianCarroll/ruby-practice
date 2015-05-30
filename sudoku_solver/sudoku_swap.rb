require 'matrix'

class Sudoku
    def initialize(matrix)
        @matrix= matrix
    end

    def get_duplicate_cells
        dup_cells = []
        9.times do |i|
            column = @matrix.column(i)
            row = @matrix.column(i)
            dup_cells += duplicates_in_row(column, i)
            dup_cells += duplicates_in_row(row, i)
        end
        return dup_cells
    end

    def duplicates_in_row(row, i)
        value_hash = get_values_as_hash(row,i)
        dupes= []
        value_hash.each do |key,pos|
            dupes += pos if pos.length > 1
        end
        return dupes
    end

    def get_values_as_hash(row,i)
        hash = Hash.new []
        row.each_with_index do |val,col|
            hash[val] += [Position.new(i, col)]
        end
        p hash
        return hash
    end
end
