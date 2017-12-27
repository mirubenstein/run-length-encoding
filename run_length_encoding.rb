class RunLengthEncoding

  def self.encode(input)
    input.scan(/((.)\2*)/).each_with_object('') do |(group, letter), output|
      output.concat(group.length.to_s) unless group.length == 1
      output.concat(letter)
    end
  end

  def self.decode(input)
    input.scan(/(\d*(.))/).each_with_object('') do |(group, letter), output|
      if group.to_i.zero?
        output.concat(letter)
      else
        group.to_i.times { output.concat(letter) }
      end
    end
  end
end

module BookKeeping
  VERSION = 3
end

# Other potential solutions
# class RunLengthEncoding
#   def self.encode(input)
#     input.gsub(/(\D)\1+/) { "#{$&.length}#{$1}" }
#   end
#
#   def self.decode(input)
#     input.gsub(/(\d+)(\D)/){ $2 * $1.to_i }
#   end
# end

# def self.encode(input)
#   input.chars.chunk(&:itself).map do |letter, group|
#     if group.size == 1
#       letter
#     else
#       "#{group.size}#{letter}"
#     end
#   end.join("")
# end
