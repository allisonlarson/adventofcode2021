data = File.read("inputs/data.txt").lines
totals = data.inject(Hash.new(0)) { |axis, instruction| 
    direction,movement = instruction.split
    if direction == "up"
        axis[:a] -= movement.to_i
    elsif direction == "down"
        axis[:a] += movement.to_i
    elsif direction == "forward"
        axis[:y] += movement.to_i
        axis[:x] += (axis[:a] * movement.to_i)
    end
    axis
}
puts totals[:x] * totals[:y]