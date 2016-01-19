Array2D = Struct.new :input do
  def find_highest_hourglass
    t = input.length
    max = 0
    1.upto(t-2) do |x|
      1.upto(t-2) do |y|
        max = [max, get_hourglass(x,y).inject(:+)].max
      end
    end
    max
  end

  def get_hourglass(x,y)
    [
      input[x-1][y-1],
      input[x-1][y],
      input[x-1][y+1],
      input[x][y],
      input[x+1][y-1],
      input[x+1][y],
      input[x+1][y+1],
    ]
  end
end

if __FILE__==$0
end
