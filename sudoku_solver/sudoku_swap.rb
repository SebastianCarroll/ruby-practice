require 'matrix'

class Matrix
    def []=(row, column, value)
        @rows[row][column] = value
    end
end

class Sudoku
    def initialize(matrix)
        @matrix= matrix
    end

    def get_duplicate_cells
        dup_in_rows = []
        dup_in_cols = []
        9.times do |i|
            column = @matrix.column(i)
            row = @matrix.column(i)
            dup_in_cols += duplicates_in_column(column, i)
            dup_in_rows += duplicates_in_row(row, i)
        end
        return dup_in_rows.to_set & dup_in_cols.to_set
    end

    def duplicates_in_row(row, i)
        value_hash = Hash.new []
        row.each_with_index do |val,col|
            value_hash[val] += [Position.new(i,col)]
        end
        return get_dupes value_hash
    end

    def duplicates_in_column(col, i)
        value_hash = Hash.new []
        col.each_with_index do |val,row|
            value_hash[val] += [Position.new(row, i)]
        end
        return get_dupes value_hash
    end

    def get_dupes(hash_in)
        return hash_in.select{|key,pos| pos.length > 1 }.values.flatten
    end
end
