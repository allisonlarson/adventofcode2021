class Day7
    def initialize(filename)
        @data = File.read(filename).split(",").map(&:to_i).sort
    end

    def one_fuel
        m = median_crab(@data)
        @data.sum { |crab| (crab - m).abs }
    end

    def median_crab(data)
       l = data.length
       (data[(l-1)/2] + data[l/2])/2
    end
end
puts Day7.new(ARGV[0]).one_fuel
