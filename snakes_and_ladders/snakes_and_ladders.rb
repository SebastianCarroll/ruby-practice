if __FILE__==$0
  @t = gets.chomp.to_i
  @t.times do
    @l = gets.chomp.to_i
    @ladders = []
    @l.times do
      @ladders << gets.chomp.split.map(&:to_i)
    end
    @s = gets.chomp.to_i
    @snakes = []
    @s.times do
      @snakes << gets.chomp.split.map(&:to_i)
    end
    # Here we want to move from 1-100 as quickly as possible.
    # With no snakes or ladders we would just roll all 6's until getting to 100 (with the last roll being whatever to get to 100)
    # With snakes and ladders we want to adopt that strategy unless we would land on a snake or a shorter path exists up a snake. 
    # We can't use a greedy strategy as we might take a ladder to one layer up only to miss a ladder straight to the end. We also don;t want to avoid snakes entirely. It may be fastest to get a ladder, catch the snake and then get the ladder to the top.
    # Looks like we can't optimise this any more than move 6 if no other options available.
  end
end
