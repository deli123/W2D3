class Player
    def get_move
        print "Enter a position with coordinates separated with a space like #{"4 7"}: "
        input = gets.chomp.split(" ")
        return [input[0].to_i, input[1].to_i]
    end
end
