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

# Get the first 4 called numbers, since there won't be a match before then
called_nums = called_nums.split(",")
prev_called = called_nums[0...4]
called_nums = called_nums[4..called_nums.length]

# Track winning boards, taking them out off the pool and recording at which point they won
winning_boards = []
called_nums.each { |num| 
    prev_called << num
    boards.each { |board| 
        board_and_flipped = board + board.transpose
        if board_and_flipped.any? { |row| row.all? { |n| prev_called.include?(n) } }
            winning_boards << [board.flatten,num]
            boards.delete(board)
        end
        
    }
}

# Pull out the first and last winners, and grab the previous called numbers
first_winner, first_winning_number = winning_boards.first
last_winner, last_winning_number = winning_boards.pop
first_called, _ = prev_called.slice_after(first_winning_number).to_a
last_called, _ = prev_called.slice_after(last_winning_number).to_a

puts (first_winner - first_called).map(&:to_i).sum * first_winning_number.to_i
puts (last_winner - last_called).map(&:to_i).sum * last_winning_number.to_i

