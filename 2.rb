data = File.read("inputs/input2.txt").lines
x = 0
y = 0
a = 0 
data.each { |instruction| 
    direction,movement = instruction.split
    if direction == "up"
        a -= movement.to_i
    end
    if direction == "down"
        a += movement.to_i
    end
    if direction == "forward"
        y += movement.to_i
        x += (a * movement.to_i)
    end
}
puts x * y