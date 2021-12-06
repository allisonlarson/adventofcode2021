class Day6
    def initialize(filename)
        data = File.read(filename).split(",").map(&:to_i)
        @school = data.tally
    end

    def run(day_count)
        day_count.to_i.times do 
            new_school = Hash.new(0)
            @school.each do |d, f|
                if d == 0
                    new_school[6] += f
                    new_school[8] += f
                else
                    new_school[d-1] += f
                end
            end
            @school = new_school
        end
        @school.values.sum
    end 
end

puts Day6.new(ARGV[0]).run(ARGV[1])