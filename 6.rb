
class Day6
    def initialize(filename)
        data = File.read(filename).split(",")
        @school = data.map { |f| Fish.new(f.to_i) }
    end

    def run(day_count)
        day_count.to_i.times do 
            @school = age_fish(@school)
        end
        puts @school.count
    end 

    def age_fish(school_of_fish)
        new_fish = []
        school_of_fish.each do |f| 
            n = *f.age
            new_fish.push(*n)
        end
        school_of_fish.push(*new_fish.compact)
        school_of_fish
    end

    class Fish
        def initialize(age = 8)
            @age = age
        end

        def age
            if @age == 0
                # perform callback to create a new one
                @age = 6
                [Fish.new]
            else 
                @age -= 1
                []
            end
        end
    end
end

day6 = Day6.new(ARGV[0]).run(ARGV[1])