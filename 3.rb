data = File.read("inputs/input3.txt").lines.map { |x| x.chomp.split("") }

gamma = ""
epsilon = ""

first, *rest = data
zipped = first.zip(*rest)
zipped.each { |digit| 
    if digit.map(&:to_i).sum >= digit.length/2
        gamma += "1"
        epsilon += "0"
    else
        gamma += "0"
        epsilon += "1"
    end
} 

gamma_value = gamma.to_i(2)
epsilon_value = epsilon.to_i(2)

puts gamma_value * epsilon_value

def filter(opts, oxy=true, pos=0)
    return opts if opts.length == 1 
    totals = {"0" => [], "1" => []}
    opts.each { |opt| opt[pos] == "0" ?  totals["0"] << opt : totals["1"] << opt }
    if totals["0"].length > totals["1"].length

        opts = oxy ? totals["0"] : totals["1"]
    else 
        opts = oxy ? totals["1"] : totals["0"]
    end
    filter(opts, oxy, pos+1)
end

oxy = filter(data).flatten.join.to_i(2)
co2 = filter(data, false).flatten.join.to_i(2)

puts oxy * co2