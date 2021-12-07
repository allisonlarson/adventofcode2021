class Day7
    def initialize(filename)
        @data = File.read(filename).split(",").map(&:to_i).sort
    end

    def one_fuel
        m = median_crab(@data)
        @data.sum { |crab| (crab - m).abs }
    end

    def many_fuels
        (0...@data.max).map do |pos|
            fuel = @data.sum do |crab| 
               n = (crab - pos).abs 
               (n**2 + n) / 2
            end
        end.min
    end

    def median_crab(data)
       l = data.length
       (data[(l-1)/2] + data[l/2])/2
    end
end
puts Day7.new(ARGV[0]).one_fuel
puts Day7.new(ARGV[0]).many_fuels
