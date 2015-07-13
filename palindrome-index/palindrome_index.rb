require 'set'

# Enter your code here. Read input from STDIN. Print output to STDOUT
def palindrome(str, ignore=false)
    left = 0
    right = str.length() -1
    while left < right 
        left += 1 if left == ignore
        right -= 1 if right == ignore
        break if str[left] != str[right]
        left += 1
        right -= 1
    end
    return left >= right
end

def not_equal(str,i,ignore)
    left = i
    right = str.length() -i - 1
    
    # Skip the ignored value
    left += 1 if left == ignore
    right -= 1 if right == ignore
    
    return str[left] == str[right]
end

def get_failing(str,test,ignores)
    failed_ignores = Set.new
    ignores.each do |ignore|
        failed_ignores << ignore if not_equal(str,test,ignore)
    end
    return failed_ignores
end

t = gets.chomp.to_i

t.times do
    str = gets.chomp.split("")
    poss_ignores = str.length.times.to_set
    test = 0
    while poss_ignores.size > 1 && str.length/2 > test
        failing = get_failing(str,test,poss_ignores)
        poss_ignores = poss_ignores - failing
        test += 1
        p poss_ignores
    end
    # for each of the possible ignores, first check if the outermost succeed.
    # for each remaining possible ignore, check if the secondmost succeed
end