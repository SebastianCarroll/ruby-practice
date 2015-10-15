require 'rspec'
require_relative '../read_time'

describe TimeReader do
    [
        [5,0,"five o' clock"],
        [6,0,"six o' clock"],
        [5,01,"one minute past five"],
    ].each do |input|
        hour= input[0]
        min= input[1]
        out= input[2]
        it "#{hour}:#{min} should print #{out}" do
            tr = TimeReader.new(hour,min)
            expect(tr.to_s).to eq(out)
        end
    end
end