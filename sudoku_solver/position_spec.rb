require './position'

describe Position do
    it "should take a row and col as arguments" do
        col = 0
        row = 2
        p = Position.new row, col
        expect(p.col).to eq(col)
        expect(p.row).to eq(row)
    end

    it "should treat objects the same that have the same position" do
        col = 0
        row = 2
        p1 = Position.new row, col
        p2 = Position.new row, col
        expect(p1).to eq(p2)
    end
end

