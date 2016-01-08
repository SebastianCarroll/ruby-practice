class Board
  def initialize(snakes, ladders)
    @snakes = snakes
    @ladders = ladders
    @position = 1
    @moves = 0
  end

  def fastest
    until @position == 100
      distance = (100-@position)
      move = distance>6 ? 6 : distance
      @position += move
      @moves += 1
    end 
    @moves
  end
end
