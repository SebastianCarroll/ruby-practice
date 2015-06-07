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

    it "should implement the eql? method" do
        col = 0
        row = 2
        p1 = Position.new row, col
        p2 = Position.new row, col
        expect(p1.eql? p2).to be true
    end

    it "should implement the hash method" do
        col = 0
        row = 2
        p1 = Position.new row, col
        p2 = Position.new row, col
        expect(p1.hash ).to eq(p2.hash)
    end

    it "should treat equal objects as the same key in hashes" do
        col = 0
        row = 7
        p1 = Position.new row, col
        p2 = Position.new row, col
        hash = Hash.new
        hash[p1] = true
        expect(hash.key?(p2)).to be true
    end

    it "should include and optional value" do
        row, col, val = 2, 4, 7
        p1 = Position.new row, col, val
        expect(p1.val).to eq(val)
    end
end

