require './position'

describe Position do
  it "should have column and row entries" do
   p = Position.new
   p.col = 0
   p.row = 2
   expect(p.col).to eq(0)
   expect(p.row).to eq(2)
  end
end

