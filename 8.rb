data = File.read(ARGV[0]).lines.map { |l| l.chomp.split(" | ")}
puts data.sum { |line| 
    line[1].split(" ").sum { |s|
        if s.length == 2 
            1
        elsif s.length == 4
            1
        elsif s.length == 3
            1
        elsif s.length == 7 
            1
        else
            puts "ignoring #{s}"
            0
        end
    }
}
