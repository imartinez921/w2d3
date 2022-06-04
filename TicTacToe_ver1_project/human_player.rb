class Human_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Player #{mark}, please enter position as two numbers with a space between them eg. '4 7'"
        resp = gets.chomp #always returns a string so need to make certain tests for invalid input
        if resp.include?("  ") || resp.length > 3 || resp[0].to_i == 0 || resp[2].to_i == 0
            raise "Please check input!!! Follow directions."
        end
        pair = resp.split(" ").map! {|ele| ele.to_i} #string => array => map! for each ele to integer
    end


end


