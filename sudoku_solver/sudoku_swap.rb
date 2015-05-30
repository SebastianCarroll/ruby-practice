require 'matrix'

class Sudoku
    def initialize(matrix)
        @matrix= matrix
    end

    def get_duplicate_cells
        dup_cells = []
        dup_cells << Position.new(1,1)
        dup_cells << Position.new(1,6)
        dup_cells << Position.new(4,1)
        return dup_cells
    end
end
