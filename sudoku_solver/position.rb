class Position
    attr_accessor :row, :col

    def initialize(row, col)
        @row = row
        @col = col
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
