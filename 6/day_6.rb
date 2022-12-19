require "debug"

class Day6
  PACKET = 4.freeze
  MESSAGE = 14.freeze

  def self.find_start_marker(buffer, unique_chars: PACKET)
    buffer = (" " + buffer).chars.to_a
    1.upto(buffer.size - unique_chars) do |i|
      return i + unique_chars - 1 if buffer[i..i + unique_chars - 1].uniq.count == unique_chars
    end
  end
end

# puts Day6.find_start_marker(File.read("6/input"))
puts Day6.find_start_marker(File.read("6/input"), unique_chars: Day6::MESSAGE)