require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        print "#{@board.num_ships} ships placed\n"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "You lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            print "You win"
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win? || self.lose?  
            return true
        else
            return false
        end
    end

    def turn
        move = @player.get_move
        if !@board.attack(move)
            @remaining_misses -= 1
        end
        @board.print
        print "#{@remaining_misses} remaining misses"
    end
end
