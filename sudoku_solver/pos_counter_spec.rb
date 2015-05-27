require './pos_counter'

describe PosCount do
  it "should have val and pos entries" do
   pc = PosCount.new
   pc.val = 10
   pc.pos = 2
   expect(pc.val).to eq(10)
   expect(pc.pos).to eq(2)
  end
end

