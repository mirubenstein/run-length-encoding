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
