require './pos_counter'

describe PosCount do
  it "should have column and row entries" do
   pc = PosCount.new
   pc.col = 0
   pc.row = 2
   expect(pc.col).to eq(0)
   expect(pc.row).to eq(2)
  end
end

