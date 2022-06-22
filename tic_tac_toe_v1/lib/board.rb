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

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? { |m| m == mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        transposed = @grid.transpose
        transposed.each do |row|
            if row.all? { |m| m == mark}
                return true
            end
        end
        return false
    end

    def win_diagonal?(mark)
        if @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark
            return true
        elsif @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
            return true
        else
            return false
        end
    end

    def win?(mark)
        return win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any? { |m| m == "_" }
        end
        return false
    end
end