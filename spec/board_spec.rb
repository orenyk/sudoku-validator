require_relative "../lib/board.rb"

describe Board do
  context "#rows" do
    it "returns an array of rows" do
      grid = mock_grid
      board = Board.new(grid: grid)
      expected = Array.new(9, (1..9).to_a)

      result = board.rows

      expect(result).to eq(expected)
    end
  end

  context "#cols" do
    it "returns an array of the columns" do
      grid = mock_grid
      board = Board.new(grid: grid)
      expected = Array.new(9) { |i| Array.new(9, i+1) }

      result = board.cols

      expect(result).to eq(expected)
    end
  end

  context "#subgroups" do
    it "returns an array of subgroups" do
      grid = mock_grid
      board = Board.new(grid: grid)
      expected = Array.new(9) do |i|
        base = 3 * (i % 3)
        ((base + 1)..(base + 3)).to_a * 3
      end

      result = board.subgroups

      expect(result).to eq(expected)
    end
  end

  def mock_grid
    Array.new(9, (1..9).to_a)
  end
end
