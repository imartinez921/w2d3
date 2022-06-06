class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def Code.valid_pegs?(charArr)
    charArr.each do |char|
      if !POSSIBLE_PEGS.has_key?(char.upcase)
        return false
      end
    end
  return true
  end

  def Code.random(num) #Array.new(length, default element)    #rand(range)
    Code.new( Array.new(num) {POSSIBLE_PEGS.keys[rand(0..3)]} )        #remember random has no . but takes a range OF INDEXES most often
    # second arg = default elements will be random pegs})
  end

  def Code.from_string(string)
    Code.new( string.split(""))
    #default elements have to be values from PEG hash using string chars as keys
  end

  def initialize(charArr)
    if Code.valid_pegs?(charArr)
      @pegs = charArr.map do |ele|
        if ele == ele.downcase
          ele.upcase
        else
          ele
        end
      end
    else
      raise "ERROR!!!"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if guess[i] == @pegs [i]
        count += 1
      end
    end
    return count
  end

  def ==(code)
    (0...code.length).each do |i|
      if code[i] != self[i]
        return false
      end
    end
    return true
  end




  


end
