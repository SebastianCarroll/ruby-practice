require './position'

describe Position do
    it "should take a row and col as arguments" do
        col = 0
        row = 2
        p = Position.new row, col
        expect(p.col).to eq(col)
        expect(p.row).to eq(row)
    end
end

