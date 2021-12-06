
class Day6
    def initialize(filename)
        data = File.read(filename).split(",").map(&:to_i)
        @school = Hash.new(0)
        data.each { |f| @school[f] += 1 }
    end

    def run(day_count)
        day_count.to_i.times do 
            new_school = {}
            new_school[0] = @school[1]
            new_school[1] = @school[2]
            new_school[2] = @school[3]
            new_school[3] = @school[4]
            new_school[4] = @school[5]
            new_school[5] = @school[6] 
            new_school[6] = @school[7] + @school[0]
            new_school[7] = @school[8]
            new_school[8] = @school[0]
            @school = new_school
        end
        @school.values.sum
    end 
end

puts Day6.new(ARGV[0]).run(ARGV[1])