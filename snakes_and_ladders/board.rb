require 'set'
require 'pry'
require 'pry-nav'

class Board
  attr_accessor :links
  def initialize(snakes, ladders)
    @links = {}
    add_to_links(snakes,ladders)
    @position = 1
    @moves = 0
    @front = []
    @visited = Set.new
  end

  def fastest
    # What if no solution possible? How to tell?
    until @position == 100
      get_moves.each{|v| @front << [v, @moves+1]}
      next_move = @front.shift
      return -1 if next_move.nil?
      @visited.add(next_move[0])
      @position, @moves = next_move
    end 
    @moves
  end

  def get_moves
    max = [@position+6,100].min
    (@position+1).upto(max)
             .map{|o| @links.key?(o) ? @links[o] : o}
             .reject{|v| @visited.include? v}
  end

  private
  # Can treat snakes and ladders as just 'links'
  def add_to_links(s,l)
    s.each{|st,e| @links[st] = e} #unless s.empty?
    l.each{|st,e| @links[st] = e} #unless s.empty?
  end
end

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
    # We could brute force but that is just not efficient when we can search.
    # Since we are looking for shortest path the BFS is probably the most approprate
    puts Board.new(@snakes,@ladders).fastest
  end
end
