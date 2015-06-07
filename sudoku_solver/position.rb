class Position
    attr_accessor :row, :col, :val

    def initialize(row, col, val=-1)
        @row = row
        @col = col
        @val = val
    end

    def ==(position_two)
        position_two.row == row && position_two.col == col
    end

    def eql?(position_two)
        self == position_two
    end

    def hash
        [@row, @col].hash
    end
end
