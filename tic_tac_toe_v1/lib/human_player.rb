class HumanPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        begin 
            print "Player #{@mark}, enter two numbers representing a position in the format `row col`: "
            input = gets.chomp.split(" ")
            valid_input?(input)
        rescue => e
            puts e.message
            retry
        end
        return [input[0].to_i, input[1].to_i]
    end  

    def valid_input?(input)
        if input.length != 2
            raise RuntimeError.new "Sorry, that was invalid"
        end
        row, col = [input[0].to_i, input[1].to_i]

        if !row.instance_of?(Integer) && !col.instance_of?(Integer)
            raise RuntimeError.new "Sorry, that was invalid"
        end
        if row < 0 || row > 2 || col < 0 || col > 2
            raise RuntimeError.new "Sorry, that was invalid"
        end
    end
end