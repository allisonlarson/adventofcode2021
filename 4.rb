called_nums, *raw_boards = File.read("inputs/input4.txt").split("\n\n")

# Build board arrays ft sequences across & sequences down
# Each board is an array of arrays
# [
#  [
#   ["x", "y", "z"],
#   ["a", "b", "c"],
#   ["e", "f", "g"],
#  ],
#  [ 
#   ["x", "a", "e"],
#   ["y", "b", "f"],
#   ["z", "c", "g"],
#  ],
# ]
boards = raw_boards.map { |b| b.split("\n").map(&:split)}
flipped_boards = boards.map(&:transpose)
boards = boards + flipped_boards

# Get the first 4 called numbers, since there won't be a match before then
called_nums = called_nums.split(",")
prev_called = called_nums[0...4]
called_nums = called_nums[4..called_nums.length]

called_nums.each { |num| 
    prev_called << num
    board = boards.find { |board| 
        board.any? { |row| 
            row.all? { |n| prev_called.include?(n) }
        }
    }

    if board 
        puts (board.flatten - prev_called).map(&:to_i).sum * num.to_i
        break
    end
}
