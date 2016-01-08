class Board
  attr_accessor :links
  def initialize(snakes, ladders)
    @links = {}
    add_to_links(snakes,ladders)
    @position = 1
    @moves = 0
  end

  def fastest
    until @position == 100
      upcoming = get_next_links
      if upcoming.empty?
        distance = (100-@position)
        move = distance>6 ? 6 : distance
        @position += move
        @moves += 1
      end
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
