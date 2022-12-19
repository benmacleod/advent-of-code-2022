require "debug"
class Day5
  CRATEMOVER_9000 = 9000.freeze
  CRATEMOVER_9001 = 9001.freeze

  def self.decode_arrangement(lines)
    rows = []
    lines.each do |line|
      break if line.match?(/\d/)
      rows << line.chars.each_slice(4).map { |c| c[1] }
    end
    num_cols = rows.map(&:size).max
    rows
      .map { |row| row.fill(" ", row.length + 1, num_cols - row.length - 1) }
      .transpose
      .map { |column| column.reject { |c| c == " " }.compact }
  end

  def self.apply_moves(stacks, moves, crane: CRATEMOVER_9000)
    moves.each { |move| apply_move(stacks, move, crane: crane) }
    stacks
  end

  def self.apply_move(stacks, move, crane: CRATEMOVER_9000)
    move.scan(/\d{1,2}/).map(&:to_i) => [num, from, to]
    case crane
    when CRATEMOVER_9000
      num.times { stacks[to - 1].unshift(stacks[from - 1].shift) }
    when CRATEMOVER_9001
      stacks[to - 1].unshift(stacks[from - 1].shift(num)).flatten!
    end
    stacks
  end
end

stacks = Day5.decode_arrangement(File.readlines("5/arrangement"))
moves = File.readlines("5/moves")
# puts Day5.apply_moves(stacks, moves, crane: Day5::CRATEMOVER_9000).map(&:first).join
puts Day5.apply_moves(stacks, moves, crane: Day5::CRATEMOVER_9001).map(&:first).join
