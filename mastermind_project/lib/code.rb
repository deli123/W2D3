class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |c| POSSIBLE_PEGS.has_key?(c.upcase) }
  end

  def self.random(length)
    arr = []
    length.times { arr << POSSIBLE_PEGS.keys.sample } 
    Code.new(arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.chars)
  end
  
  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise "Invalid pegs"
    end
    @pegs = chars.map { |c| c.upcase }
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, i|
      if @pegs[i] == peg
        count += 1
      end
    end
    return count
  end

  def num_near_matches(code)
    tally = @pegs.tally
    count = 0

    # remove exact matches
    @pegs.each_with_index do |p, i|
      if p == code[i]
        tally[p] -= 1
      end
    end

    # if the peg is not an exact match, 
    # check if there are any remaining elements that have matches
    (0...@pegs.length).each do |i|
      if @pegs[i] != code[i]
        if tally[code[i]] != nil
          if tally[code[i]] > 0
            tally[code[i]] -= 1
            count += 1
          end
        end
      end
    end
    return count
  end

  def ==(code)
    if @pegs.length != code.pegs.length
      return false
    end
    return @pegs == code.pegs
  end
end
