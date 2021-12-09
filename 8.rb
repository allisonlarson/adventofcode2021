class Day7
#   0:      1:      2:      3:      4:
#  aaaa    ....    aaaa    aaaa    ....
# b    c  .    c  .    c  .    c  b    c
# b    c  .    c  .    c  .    c  b    c
#  ....    ....    dddd    dddd    dddd
# e    f  .    f  e    .  .    f  .    f
# e    f  .    f  e    .  .    f  .    f
#  gggg    ....    gggg    gggg    ....
# 
#   5:      6:      7:      8:      9:
#  aaaa    aaaa    aaaa    aaaa    aaaa
# b    .  b    .  .    c  b    c  b    c
# b    .  b    .  .    c  b    c  b    c
#  dddd    dddd    ....    dddd    dddd
# .    f  e    f  .    f  e    f  .    f
# .    f  e    f  .    f  e    f  .    f
#  gggg    gggg    ....    gggg    gggg

    def initialize(filename)
        @data = File.read(filename).lines.map { |l| l.chomp.split(" | ")}
    end

    def add_numbers
        @data.sum { |line| 
            all_nums, output = *line
            grouped_ciphers = all_nums.split(" ").group_by(&:length)
            one = grouped_ciphers[2].first.chars.sort.join
            seven = grouped_ciphers[3].first.chars.sort.join
            four = grouped_ciphers[4].first.chars.sort.join
            eight = grouped_ciphers[7].first.chars.sort.join

            seg_cf, seg_fc = *one.split("")
            seg_a = seven.delete(seg_cf).delete(seg_fc)
            seg_bd, seg_db = *four.delete(seg_cf).delete(seg_fc).split("")
            zero = grouped_ciphers[6].find { |i| ([seg_bd, seg_db] - i.chars).length == 1 }
            seg_d = ([seg_bd, seg_db] - zero.chars).first
            seg_b = (seg_d == seg_bd) ? seg_db : seg_bd
            three = grouped_ciphers[5].find { |i| (i.chars - [seg_a, seg_cf, seg_d, seg_fc]).length == 1}
            seg_g = (three.chars - [seg_a, seg_cf, seg_d, seg_fc, seg_g])[0]
            five = grouped_ciphers[5].find { |i| (i.chars - [seg_a, seg_b, seg_d, seg_g]).length == 1}
            seg_f = (five.chars - [seg_a, seg_b, seg_d, seg_g]).first
            seg_c = ([seg_cf,seg_fc] - [seg_f]).first
            nine = grouped_ciphers[6].find { |i| (i.chars.sort - [seg_a, seg_b, seg_c, seg_d, seg_f, seg_g]).length == 0}
            six = (grouped_ciphers[6] - [nine, zero])[0]
            two = (grouped_ciphers[5] - [five, three])[0]

            key = {
                zero.chars.sort.join => "0",
                one => "1",
                two.chars.sort.join => "2",
                three.chars.sort.join => "3",
                four => "4",
                five.chars.sort.join => "5",
                six.chars.sort.join => "6",
                seven => "7",
                eight => "8",
                nine.chars.sort.join => "9"
            }
            output.split(" ").inject("") { |full, n|
                full << key[n.chars.sort.join]
        }.to_i

        }
    end

    def count_numbers
        @data.sum { |line| 
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
    end
end

day7 = Day7.new(ARGV[0])
puts day7.count_numbers
puts day7.add_numbers


