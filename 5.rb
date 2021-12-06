class Day5
    def initialize(filename)
        @points = Hash.new { |hash, key| hash[key] = Hash.new{ |hash, key| hash[key] = 0} }
        build_graph(File.read(filename).lines)
    end

    def build_graph(data)
        data.each { |line| draw(*line.split(" -> ")) }
    end

    def count_intersections
        @points.values.inject(0) do |count, y_hash|
            count + y_hash.values.count { |i| i > 1 }
        end
    end

    # Takes start coordinate(a) & end coordinate(b), 
    # Adds or updates to @points 
    def draw(a, b)
        a_x, a_y = *a.split(",").map(&:to_i)
        b_x, b_y = *b.split(",").map(&:to_i)
        if a_x == b_x
            y1,y2 = *[a_y,b_y].sort 
            (y1..y2).each { |y_coord| 
                @points[a_x][y_coord] += 1
            }
        elsif a_y == b_y
            x1,x2 = *[a_x,b_x].sort 
            (x1..x2).each { |x_coord| 
                @points[x_coord][a_y] += 1
            }
        else
            puts "ignored #{a_x},#{a_y} -> #{b_x},#{b_y}!"
        end
    end
end

puts Day5.new(ARGV[0]).count_intersections