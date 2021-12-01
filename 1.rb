data = File.read("inputs/input1.txt").split.collect!(&:to_i)
puts data.each_cons(2).inject(0) { |s, x| x[0] < x[1] ? s+=1 : s }

prev = 0
puts data.each_cons(3).inject(0) { |s, x| 
    current = x.inject(:+)
    if prev != 0 && prev < current
        s+=1
    end
    prev = current
    s
}