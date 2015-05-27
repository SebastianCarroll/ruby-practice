require 'matrix'

def get_matrix
    array = []
    9.times {array << gets.chomp.split.map(&:to_i)}
    return Matrix[array]
end

gets.chomp.to_i.times {
    puts get_matrix
}
