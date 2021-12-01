data = File.read("inputs/input1.txt").split
puts data.each_cons(2).inject(0) { |s, x| x[0].to_i < x[1].to_i ? s+=1 : s }

prev = 0
puts data.each_cons(3).inject(0) { |s, x| 
    current = x[0].to_i + x[1].to_i + x[2].to_i 
    if prev != 0 && prev < current
        s+=1
    end
    prev = current
    s
}