require "board"

describe "Board" do
  let(:board) { Board.new() }

  describe "#initialize" do
    it "should not accept any args" do
      board
    end

    it "should set @grid to be a 2D array with 3 rows and 3 columns" do
      grid = board.instance_variable_get(:@grid)
      expect(grid.length).to eq(3)
      expect(grid[0].length).to eq(3)
    end

    it "should set all elements of @grid to '_'" do
      grid = board.instance_variable_get(:@grid)
      nil_grid = Array.new(3) { Array.new(3, '_') }
      expect(grid).to eq(nil_grid)
    end

    it "should make each subarray of @grid refer to a distinct array" do
      grid = board.instance_variable_get(:@grid)
      expect(grid[0]).to_not be(grid[1])
    end
  end

  describe "#[]" do
    it "should accept an array containing a pair of indices in the form [row, column] representing a position on the @board" do
      pos = [1, 2]
      board[pos]
    end

    it "should return the element of @grid at the given position" do
      grid = board.instance_variable_get(:@grid)
      grid[1][2] = :X

      pos_1 = [1, 2]
      expect(board[pos_1]).to be(:X)

      pos_2 = [0, 0]
      expect(board[pos_2]).to eq('_')
    end
  end

  describe "#[]=" do
    it "should accept a position and a mark as args" do
      pos = [1, 2]
      board[pos] = :X
    end

    it "should set the given position of @grid to the given value" do
      pos_1 = [1, 2]
      board[pos_1] = :X
      expect(board[pos_1]).to eq(:X)

      pos_2 = [2, 2]
      board[pos_2] = :O
      expect(board[pos_2]).to eq(:O)
    end
  end
end
