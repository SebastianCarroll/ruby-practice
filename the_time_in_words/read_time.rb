class TimeReader
    HOURS = {
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
    }

    def initialize(hour, minutes)
        @hour = hour
        @minutes = minutes
    end

    def to_s
        "#{HOURS[@hour]} o' clock"
    end
end
