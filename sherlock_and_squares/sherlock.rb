require "benchmark"
require 'gruff'

class Numeric
  def sqrt; Math.sqrt(self); end
end

def bigo_logn(l,h)
  n = l.sqrt.ceil
  count = 0
  while n**2 <= h
    n += 1
    count += 1
  end
  return count
end

def bigo_1(l,h)
  h.sqrt.floor - l.sqrt.ceil + 1
end

l = 3
loop_times = []
eqn_times = []
labels = {}
count = 0
1.upto(200).map{|a| a*1000}.each do |h|
  
  loop_time = Benchmark.realtime do
    10000.times {bigo_logn(l,h*2)}
  end
  
  eqn_time = Benchmark.realtime do
    10000.times {bigo_1(l,h*2)}
  end
  labels[count] = (h-l).to_s if count%25 == 0
  count += 1
  loop_times << (loop_time)
  eqn_times << (eqn_time)
end

g = Gruff::Line.new(600)
g.y_axis_label = 'Execution Time (sec/10k runs)'
g.x_axis_label = 'Difference (High - low)'
g.labels = labels
g.data(:Loop, loop_times)
g.data(:Equation, eqn_times)
g.write('output/loop_v_eqn_time.png')
