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
    until @position == 100
      upcoming = get_next_links
      if upcoming.empty?
        @front << [[@position+6,100].min, @moves+1]
      else
        upcoming.each do |k,v|
          @front << [v, @moves+1] unless @visited.include? v
        end
        @front << [(@position+6), @moves+1] unless upcoming.key? (@position+6)
      end
      next_move = @front.shift
      @visited.add(next_move[0])
      @position, @moves = next_move
    end 
    @moves
  end

  def get_next_links
    @links.select{|k,v| k>@position && k<=(@position+6)}
  end

  private
  # Can treat snakes and ladders as just 'links'
  def add_to_links(s,l)
    s.each{|st,e| @links[st] = e} #unless s.empty?
    l.each{|st,e| @links[st] = e} #unless s.empty?
  end
end
