class TimeReader
    D_TO_S = {
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine",
        10 => "ten",
        11 => "eleven",
        12 => "twelve",
        13 => "thirteen",
        14 => "fourteen",
        15 => "fifteen",
        16 => "sixteen",
        17 => "seventeen",
        18 => "eighteen",
        19 => "ninteen",
        20 => "twenty",
        21 => "twenty one",
        22 => "twenty two",
        23 => "twenty three",
        24 => "twenty four",
        25 => "twenty five",
        26 => "twenty six",
        27 => "twenty seven",
        28 => "twenty eight",
        29 => "twenty nine",
        30 => "thirty",
    }

    def initialize(hour, minutes)
        @hour = hour
        @minutes = minutes
    end

    def plural_min(min)
        min == 1 ? "" : "s"
    end

    def to_s
        if @minutes==0
            "#{D_TO_S[@hour]} o' clock"
        elsif @minutes == 15
            "quarter past #{D_TO_S[@hour]}"
        elsif @minutes == 30
            "half past #{D_TO_S[@hour]}"
        elsif @minutes > 30
            diff = 60-@minutes
            n_hour = (@hour==12 ? 1 : @hour+1)
            @minutes==45 ?  "quarter to #{D_TO_S[n_hour]}" : "#{D_TO_S[diff]} minute#{plural_min diff} to #{D_TO_S[n_hour]}"
        else
            "#{D_TO_S[@minutes]} minute#{plural_min @minutes} past #{D_TO_S[@hour]}"
        end
    end
end

if __FILE__ == $0
    hour = gets.strip.to_i
    min = gets.strip.to_i
    puts TimeReader.new(hour,min).to_s
end
