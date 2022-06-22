class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, "_")}
    end

    def [](pos)
        @grid[pos.first][pos.last]
    end
    
    def []=(pos, mark)
        @grid[pos.first][pos.last] = mark
    end

    def valid?(pos)
        row, col = pos
        return row >= 0 && row <= 3 && col >= 0 && col <= 3
    end

    def empty?(pos)
        return self[pos] == "_"
    end

    def place_mark(pos, mark)
        if !valid?(pos) || !empty?(pos)
            raise "Invalid position"
        end

        self[pos] = mark
    end
end